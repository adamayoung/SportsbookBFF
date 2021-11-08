import Graphiti
import Sportsbook
import Vapor

extension Resolver {

    func fetchEventTypes(request: Request,
                         arguments: EventTypesArguments) throws -> EventLoopFuture<[EventType]> {
        let filter = arguments.eventTypesFilter

        guard let id = arguments.id else {
            return request.eventTypeService.fetchEventTypes(filter: filter)
                .mapEach(EventType.init)
        }

        return request.eventTypeService.fetchEventType(withID: id)
            .optionalMap { [$0] }
            .unwrap(orReplace: [])
            .filter(with: filter)
            .mapEach(EventType.init)
    }

}
