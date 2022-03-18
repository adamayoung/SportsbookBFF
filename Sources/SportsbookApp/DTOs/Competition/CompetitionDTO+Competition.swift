import Foundation
import Sportsbook

extension CompetitionDTO {

    init(competition: Competition) {
        self.init(id: competition.id, name: competition.name, sportID: competition.sportID)
    }

}
