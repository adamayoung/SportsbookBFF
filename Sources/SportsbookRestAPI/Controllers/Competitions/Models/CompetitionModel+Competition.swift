import Foundation
import Sportsbook

extension CompetitionModel {

    init(competition: Competition) {
        self.init(id: competition.id, name: competition.name, eventTypeID: competition.eventTypeID)
    }

}
