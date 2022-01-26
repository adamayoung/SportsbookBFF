import Graphiti
import Sportsbook
import Vapor

extension Resolver {

    func fetchEventTypes(request: Request,
                         arguments: EventTypesArguments) throws -> EventLoopFuture<[EventType]> {
        let promise = request.eventLoop.makePromise(of: [EventType].self)
        promise.completeWithTask {
            let filter = arguments.eventTypesFilter

            guard let id = arguments.id else {
                return try await request.eventTypeService.fetchEventTypes(filter: filter)
                    .map(EventType.init)
            }

            guard let eventType = try await request.eventTypeService.fetchEventType(withID: id) else {
                return []
            }

            return [eventType]
                .filter(filter)
                .map(EventType.init)
        }

        return promise.futureResult
    }

}
