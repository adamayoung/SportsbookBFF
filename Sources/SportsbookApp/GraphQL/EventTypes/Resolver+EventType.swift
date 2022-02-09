import Graphiti
import SportsbookModels
import Vapor

extension Resolver {

    func fetchEventTypes(request: Request,
                         arguments: EventTypesArguments) throws -> EventLoopFuture<[EventType]> {
        let promise = request.eventLoop.makePromise(of: [EventType].self)
        promise.completeWithTask {
            let filter = arguments.eventTypesFilter

            guard let id = arguments.id else {
                return try await EventType.all(filter: filter, on: request)
            }

            guard let eventType = try await EventType.find(id, on: request) else {
                return []
            }

            return [eventType]
//                .filter(filter)
        }

        return promise.futureResult
    }

}
