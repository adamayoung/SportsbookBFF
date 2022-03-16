import Foundation
@testable import SportsbookApp

extension Event {

    static var mocks: [Event] {
        [
            Event(
                id: 30127940,
                name: "AD Isidro Metapan v CD Municipal Limeno",
                sportID: 1,
                competitionID: 516320,
                countryCode: "GB",
                timeZone: "GMT",
                openDate: Date(iso8601String: "2021-08-22T00:00:00Z"),
                isVideoAvailable: false,
                isInPlay: false,
                canTurnInPlay: false
            ),
            Event(
                id: 30189059,
                name: "Braga v Midtjylland",
                sportID: 1,
                competitionID: 2005,
                countryCode: "GB",
                timeZone: "GMT",
                openDate: Date(iso8601String: "2021-09-30T18:00:00Z"),
                isVideoAvailable: false,
                isInPlay: true,
                canTurnInPlay: true
            ),
            Event(
                id: 30189054,
                name: "Celtic v Leverkusen",
                sportID: 1,
                competitionID: 2005,
                countryCode: "GB",
                timeZone: "GMT",
                openDate: Date(iso8601String: "2021-09-30T18:00:06Z"),
                isVideoAvailable: false,
                isInPlay: true,
                canTurnInPlay: true
            ),
            Event(
                id: 30189049,
                name: "Marseille v Galatasaray",
                sportID: 1,
                competitionID: 2005,
                countryCode: "GB",
                timeZone: "GMT",
                openDate: Date(iso8601String: "2021-09-30T18:00:00Z"),
                isVideoAvailable: false,
                isInPlay: true,
                canTurnInPlay: true
            ),
            Event(
                id: 30236195,
                name: "C Burel v A Bondar",
                sportID: 2,
                competitionID: 794523,
                countryCode: "GB",
                timeZone: "GMT",
                openDate: Date(iso8601String: "2021-09-26T09:06:37Z"),
                isVideoAvailable: false,
                isInPlay: true,
                canTurnInPlay: true
            ),
            Event(
                id: 30255779,
                name: "I Lavino v L Alhussein Abdel Aziz",
                sportID: 2,
                competitionID: 529306,
                countryCode: "GB",
                timeZone: "GMT",
                openDate: Date(iso8601String: "2021-10-01T09:30:00Z"),
                isVideoAvailable: false,
                isInPlay: false,
                canTurnInPlay: true
            ),
            Event(
                id: 30255780,
                name: "V Yushchenko v M Capurro Taborda",
                sportID: 2,
                competitionID: 11111111,
                countryCode: "GB",
                timeZone: "GMT",
                openDate: Date(iso8601String: "2021-10-01T09:30:00Z"),
                isVideoAvailable: false,
                isInPlay: false,
                canTurnInPlay: true
            ),
            Event(
                id: 9999999,
                name: "Event without valid sport",
                sportID: 999999,
                competitionID: 11111111,
                countryCode: "GB",
                timeZone: "GMT",
                openDate: Date(iso8601String: "2021-10-01T09:30:00Z"),
                isVideoAvailable: false,
                isInPlay: false,
                canTurnInPlay: true
            )
        ]
    }

    static func mock(for id: Event.ID) -> Event {
        (mocks.first { $0.id == id })!
    }

    static func mocks(forSport sportID: Sport.ID) -> [Event] {
        mocks.filter { $0.sportID == sportID }
    }

    static func mocks(forCompetition competitionID: Competition.ID) -> [Event] {
        mocks.filter { $0.competitionID == competitionID }
    }

}
