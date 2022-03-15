import Foundation

extension Competition {

    init(competition: CompetitionDomainModel) {
        self.init(id: competition.id, name: competition.name, sportID: competition.sportID)
    }

}
