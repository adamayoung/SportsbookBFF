import Graphiti
import Sportsbook
import Vapor

extension Resolver {

    func fetchEvents(request: Request, arguments: EventArguments) throws -> EventLoopFuture<[Event]> {
        request.eventService.fetchEvent(withID: arguments.id)
            .optionalMap { [$0] }
            .unwrap(orReplace: [])
    }

}
