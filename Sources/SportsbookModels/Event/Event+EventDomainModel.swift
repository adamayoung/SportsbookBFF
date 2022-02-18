import Foundation
import SportsbookCore

extension Event {

    init(event: EventDomainModel) {
        let timeZone: TimeZone? = {
            guard let identifier = event.timeZone else {
                return nil
            }

            return TimeZone(identifier: identifier)
        }()

        self.init(id: event.id, name: event.name, sportID: event.sportID, competitionID: event.competitionID,
                  countryCode: event.countryCode, timeZone: timeZone, openDate: event.openDate,
                  isVideoAvailable: event.isVideoAvailable, isInPlay: event.isInPlay,
                  canTurnInPlay: event.canTurnInPlay)
    }

}
