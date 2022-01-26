import Graphiti
import SportsbookCore
import Vapor

extension Event {

    func markets(request: Request, arguments: MarketsArguments) async throws -> [Market] {
        let markets = try await Market.all(forEvent: self.id, on: request)
        guard let marketID = arguments.id else {
            return markets
        }

        return markets.filter { $0.id == marketID }
    }

    func markets(request: Request, arguments: MarketsArguments) -> EventLoopFuture<[Market]> {
        let promise = request.eventLoop.makePromise(of: [Market].self)
        promise.completeWithTask {
            try await markets(request: request, arguments: arguments)
        }

        return promise.futureResult
    }

    func competition(request: Request, arguments: NoArguments) async throws -> Competition? {
        guard let competitionID = self.competitionID else {
            return nil
        }

        return try await Competition.find(competitionID, on: request)
    }

    func competition(request: Request, arguments: NoArguments) throws -> EventLoopFuture<Competition?> {
        let promise = request.eventLoop.makePromise(of: Optional<Competition>.self)
        promise.completeWithTask {
            try await competition(request: request, arguments: arguments)
        }

        return promise.futureResult
    }

    func eventType(request: Request, arguments: NoArguments) async throws -> EventType? {
        try await EventType.find(self.eventTypeID, on: request)
    }

    func eventType(request: Request, arguments: NoArguments) -> EventLoopFuture<EventType?> {
        let promise = request.eventLoop.makePromise(of: Optional<EventType>.self)
        promise.completeWithTask {
            try await eventType(request: request, arguments: arguments)
        }

        return promise.futureResult
    }

}
