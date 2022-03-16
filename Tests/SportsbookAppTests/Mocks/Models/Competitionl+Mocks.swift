import Foundation
@testable import SportsbookApp

extension Competition {

    static var mocks: [Competition] {
        [
            Competition(id: 516320, name: "Salvadoran Primera Division", sportID: 1),
            Competition(id: 2005, name: "UEFA Europa League", sportID: 1),
            Competition(id: 794523, name: "ITF Wiesbaden", sportID: 2),
            Competition(id: 529306, name: "ITF Cairo", sportID: 2),
            Competition(id: 810270, name: "Alfred Dunhill Links Championship 2021", sportID: 3),
            Competition(id: 810272, name: "Sanderson Farms Championship 2021", sportID: 3),
            Competition(id: 521519, name: "ICC World Cricket League Matches", sportID: 4),
            Competition(id: 518513, name: "Gallagher Premiership", sportID: 5),
            Competition(id: 31201, name: "French Top 14", sportID: 5),
            Competition(id: 514783, name: "Rugby Specials", sportID: 5),
            Competition(id: 511349, name: "Boxing Matches", sportID: 6),
            Competition(id: 111, name: "Competition with invalid Sport", sportID: 111)
        ]
    }

    static func mock(for id: Competition.ID) -> Competition {
        (mocks.first { $0.id == id })!
    }

    static func mocks(forSport sportID: Sport.ID) -> [Competition] {
        mocks.filter { $0.sportID == sportID }
    }

}
