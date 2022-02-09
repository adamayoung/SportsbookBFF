import Foundation
import SportsbookCore

extension Competition {

    init(competition: CompetitionDomainModel) {
        self.init(id: competition.id, name: competition.name, eventTypeID: competition.eventTypeID)
    }

}
