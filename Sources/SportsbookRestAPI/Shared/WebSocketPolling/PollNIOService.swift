import Foundation
import NIO
import Vapor

struct PollNIOService: PollService {

    private let cache: Cache
    private let eventLoop: EventLoop
    private let logger: Logger

    init(cache: Cache, eventLoop: EventLoop, logger: Logger) {
        self.cache = cache
        self.eventLoop = eventLoop
        self.logger = logger
    }

    func create<PollData: Codable & Equatable>(
        _ groupID: String,
        pollingFrequency: TimeInterval = 10,
        webSocket: WebSocket,
        performPollAction: @escaping () -> EventLoopFuture<PollData>
    ) -> PollingTask {
        let pollID = UUID()
        let delay: TimeAmount = .seconds(Int64(pollingFrequency))
        let primaryPollIDCacheKey = "poll-\(groupID)"
        let lastCachedPollDataCacheKey = "poll-\(groupID)-data"
        var previousStreamData: PollData?

        register(pollID, cacheKey: primaryPollIDCacheKey, groupID: groupID)
            .whenComplete { _ in }

        let task = eventLoop.scheduleRepeatedTask(initialDelay: .seconds(1), delay: delay) { _ in
            self.cache.get(primaryPollIDCacheKey, as: UUID.self)
                .flatMap { primaryStreamID -> EventLoopFuture<PollData?> in
                    guard primaryStreamID == pollID else {
                        return self.cache.get(lastCachedPollDataCacheKey, as: PollData.self)
                    }

                    return performPollAction()
                        .flatMap { streamData in
                            self.cache.set(lastCachedPollDataCacheKey, to: streamData).map { streamData }
                        }
                }
                .whenComplete { result in
                    guard let streamData = try? result.get(), streamData != previousStreamData else {
                        return
                    }

                    previousStreamData = streamData
                    webSocket.send(streamData)
                }
        }

        return PollingTask(task: task) {
            self.cache.get(primaryPollIDCacheKey, as: UUID.self)
                .flatMap { primaryPollID -> EventLoopFuture<Void> in
                    guard primaryPollID == pollID else {
                        self.logger.debug("Polling ended", metadata: [
                            "poll-id": .stringConvertible(pollID),
                            "primary-poll-id": .stringConvertible(primaryPollID ?? pollID),
                            "poll-group-id": .string(groupID)
                        ])

                        return self.eventLoop.makeSucceededVoidFuture()
                    }

                    self.logger.debug("Primary polling ended", metadata: [
                        "poll-id": .stringConvertible(pollID),
                        "primary-poll-id": .stringConvertible(primaryPollID ?? pollID),
                        "poll-group-id": .string(groupID)
                    ])
                    return self.cache.set(primaryPollIDCacheKey, to: nil as UUID?)
                        .and { self.cache.set(lastCachedPollDataCacheKey, to: nil as PollData?) }
                        .map { _ in Void() }
                }
                .whenComplete { _ in }
        }
    }

    private func register(_ streamID: UUID, cacheKey: String, groupID: String) -> EventLoopFuture<Void> {
        cache.get(cacheKey, as: UUID.self)
            .flatMap { primaryStreamID -> EventLoopFuture<Void> in
                guard primaryStreamID == nil else {
                    self.logger.debug("Polling started", metadata: [
                        "poll-id": .stringConvertible(streamID),
                        "primary-poll-id": .stringConvertible(primaryStreamID ?? streamID),
                        "poll-group-id": .string(groupID)
                    ])
                    return self.eventLoop.makeSucceededVoidFuture()
                }

                self.logger.debug("Primary polling started", metadata: [
                    "poll-id": .stringConvertible(streamID),
                    "primary-poll-id": .stringConvertible(primaryStreamID ?? streamID),
                    "poll-group-id": .string(groupID)
                ])
                return self.cache.set(cacheKey, to: streamID)
            }
    }

}

extension Request {

    var pollService: PollService {
        PollNIOService(cache: self.application.caches.memory, eventLoop: self.eventLoop, logger: self.logger)
    }

}
