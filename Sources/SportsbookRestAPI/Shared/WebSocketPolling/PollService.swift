import Foundation
import NIO
import WebSocketKit

protocol PollService {

    func create<PollData: Codable & Equatable>(
        _ groupID: String,
        pollingFrequency: TimeInterval,
        webSocket: WebSocket,
        performPollAction: @escaping () -> EventLoopFuture<PollData>
    ) -> PollingTask

}

extension PollService {

    func create<PollData: Codable & Equatable>(
        _ groupID: String,
        webSocket: WebSocket,
        performPollAction: @escaping () -> EventLoopFuture<PollData>
    ) -> PollingTask {
        self.create(groupID, pollingFrequency: 10, webSocket: webSocket, performPollAction: performPollAction)
    }

}
