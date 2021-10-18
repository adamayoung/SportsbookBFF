import Graphiti
import Sportsbook
import Vapor

extension Resolver {

    func fetchEventTypes(request: Request, arguments: EventTypesArguments) throws -> EventLoopFuture<[EventType]> {
        guard let id = arguments.id else {
            return request.eventTypeService.fetchEventTypes()
        }

        return request.eventTypeService.fetchEventType(withID: id)
            .optionalMap { [$0] }
            .unwrap(orReplace: [])
    }

}
