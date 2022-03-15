import Foundation
@testable import SportsbookApp

extension CompetitionDomainModel {

    static var mocks: [CompetitionDomainModel] {
        [
            CompetitionDomainModel(id: 516320, name: "Salvadoran Primera Division", sportID: 1),
            CompetitionDomainModel(id: 2005, name: "UEFA Europa League", sportID: 1),
            CompetitionDomainModel(id: 794523, name: "ITF Wiesbaden", sportID: 2),
            CompetitionDomainModel(id: 529306, name: "ITF Cairo", sportID: 2),
            CompetitionDomainModel(id: 810270, name: "Alfred Dunhill Links Championship 2021", sportID: 3),
            CompetitionDomainModel(id: 810272, name: "Sanderson Farms Championship 2021", sportID: 3),
            CompetitionDomainModel(id: 521519, name: "ICC World Cricket League Matches", sportID: 4),
            CompetitionDomainModel(id: 518513, name: "Gallagher Premiership", sportID: 5),
            CompetitionDomainModel(id: 31201, name: "French Top 14", sportID: 5),
            CompetitionDomainModel(id: 514783, name: "Rugby Specials", sportID: 5),
            CompetitionDomainModel(id: 511349, name: "Boxing Matches", sportID: 6),
            CompetitionDomainModel(id: 111, name: "Competition with invalid Sport", sportID: 111)
        ]
    }

    static func mock(for id: CompetitionDomainModel.ID) -> CompetitionDomainModel {
        (mocks.first { $0.id == id })!
    }

    static func mocks(forSport sportID: SportDomainModel.ID) -> [CompetitionDomainModel] {
        mocks.filter { $0.sportID == sportID }
    }

}
