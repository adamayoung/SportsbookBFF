import Foundation
import Sportsbook

extension Market {

    static var mocks: [Market] {
        [
            Market(
                id: "754.2848213",
                name: "1st Half Over/Under 5.5 Goals",
                marketDate: Date(iso8601String: "2021-10-03T18:05:00Z"),
                inPlay: false,
                canTurnInPlay: false,
                marketType: .init("1ST_HALF_OVER/UNDER_5.5_GOALS"),
                runners: [
                    .init(
                        selectionID: 4702493,
                        name: "1st Half Over 5.5 Goals",
                        handicap: 0,
                        sortPriority: 1,
                        status: .active,
                        result: .init(type: nil)
                    ),
                    .init(
                        selectionID: 4702492,
                        name: "1st Half Under 5.5 Goals",
                        handicap: 0,
                        sortPriority: 2,
                        status: .active,
                        result: .init(type: nil)
                    )
                ],
                sportID: 1,
                eventID: 30127940,
                competitionID: 516320
            ),
            Market(
                id: "754.2848209",
                name: "Double Chance",
                marketDate: Date(iso8601String: "2021-10-03T18:05:00Z"),
                inPlay: false,
                canTurnInPlay: false,
                marketType: .init("DOUBLE_CHANCE"),
                runners: [
                    .init(
                        selectionID: 5352164,
                        name: "AD Isidro Metapan And Draw",
                        handicap: 0,
                        sortPriority: 1,
                        status: .active,
                        result: .init(type: nil)
                    ),
                    .init(
                        selectionID: 5904037,
                        name: "CD Municipal Limeno And Draw",
                        handicap: 0,
                        sortPriority: 2,
                        status: .active,
                        result: .init(type: nil)
                    ),
                    .init(
                        selectionID: 8313963,
                        name: "AD Isidro Metapan And CD Municipal Limeno",
                        handicap: 0,
                        sortPriority: 3,
                        status: .active,
                        result: .init(type: nil)
                    )
                ],
                sportID: 1,
                eventID: 30127940,
                competitionID: 516320
            ),
            Market(
                id: "754.2848228",
                name: "Win & Over 2.5 Goals",
                marketDate: Date(iso8601String: "2021-10-03T18:05:00Z"),
                inPlay: false,
                canTurnInPlay: false,
                marketType: .init("WIN_&_OVER_2.5_GOALS"),
                runners: [
                    .init(
                        selectionID: 4073256,
                        name: "AD Isidro Metapan",
                        handicap: 0,
                        sortPriority: 1,
                        status: .active,
                        result: .init(type: nil)
                    ),
                    .init(
                        selectionID: 5902671,
                        name: "CD Municipal Limeno",
                        handicap: 0,
                        sortPriority: 2,
                        status: .active,
                        result: .init(type: nil)
                    )
                ],
                sportID: 1,
                eventID: 30127940,
                competitionID: 516320
            )
        ]
    }

}
