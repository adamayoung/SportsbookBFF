import Graphiti
import Sportsbook
import Vapor

extension EventType {

    func competitions(request: Request, arguments: CompetitionsArguments) throws -> EventLoopFuture<[Competition]> {
        guard let competitionID = arguments.id else {
            return request.competitionService.fetchCompetitions(forEventType: self.id)
        }

        return request.competitionService.fetchCompetition(withID: competitionID)
            .optionalMap { [$0] }
            .unwrap(orReplace: [])
    }

    func events(request: Request, arguments: EventsArguments) throws -> EventLoopFuture<[Event]> {
        guard let eventID = arguments.id else {
            return request.eventService.fetchEvents(forEventType: self.id, isInPlay: arguments.isInPlay)
        }

        return request.eventService.fetchEvent(withID: eventID)
            .map { event -> Event? in
                guard event?.eventTypeID == self.id else {
                    return nil
                }

                guard let isInPlayArgument = arguments.isInPlay else {
                    return event
                }

                guard event?.isInPlay == isInPlayArgument else {
                    return nil
                }

                return event
            }
            .optionalMap { [$0] }
            .unwrap(orReplace: [])
    }

}
