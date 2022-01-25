import Graphiti
import Sportsbook
import Vapor

extension Competition {

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

    func events(request: Request, arguments: EventsArguments) async throws -> [Event] {
        let events = try await Event.all(forCompetition: self.id, on: request)
        guard let eventID = arguments.id else {
            return events
        }

        return events.filter { $0.id == eventID }
    }

    func events(request: Request, arguments: EventsArguments) throws -> EventLoopFuture<[Event]> {
        let promise = request.eventLoop.makePromise(of: [Event].self)
        promise.completeWithTask {
            try await events(request: request, arguments: arguments)
        }

        return promise.futureResult
    }

}
