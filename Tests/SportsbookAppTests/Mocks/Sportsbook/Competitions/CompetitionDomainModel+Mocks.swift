import Foundation
import SportsbookCore

extension CompetitionDomainModel {

    static var mocks: [CompetitionDomainModel] {
        [
            CompetitionDomainModel(id: 516320, name: "Salvadoran Primera Division", eventTypeID: 1),
            CompetitionDomainModel(id: 2005, name: "UEFA Europa League", eventTypeID: 1),
            CompetitionDomainModel(id: 794523, name: "ITF Wiesbaden", eventTypeID: 2),
            CompetitionDomainModel(id: 529306, name: "ITF Cairo", eventTypeID: 2),
            CompetitionDomainModel(id: 810270, name: "Alfred Dunhill Links Championship 2021", eventTypeID: 3),
            CompetitionDomainModel(id: 810272, name: "Sanderson Farms Championship 2021", eventTypeID: 3),
            CompetitionDomainModel(id: 521519, name: "ICC World Cricket League Matches", eventTypeID: 4),
            CompetitionDomainModel(id: 518513, name: "Gallagher Premiership", eventTypeID: 5),
            CompetitionDomainModel(id: 31201, name: "French Top 14", eventTypeID: 5),
            CompetitionDomainModel(id: 514783, name: "Rugby Specials", eventTypeID: 5),
            CompetitionDomainModel(id: 511349, name: "Boxing Matches", eventTypeID: 6)
        ]
    }

}
