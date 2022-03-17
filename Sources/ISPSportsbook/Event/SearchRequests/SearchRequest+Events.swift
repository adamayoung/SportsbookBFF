import Foundation
import SCAN

extension SearchRequest {

    static func event(withID eventID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Self.eventFacet,
            filter: FilterQuery(
                eventIDs: [eventID],
                maxResults: 1
            ),
            locale: locale
        )
    }

    static func events(forCompetition competitionID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Self.eventFacet,
            filter: FilterQuery(
                competitionIDs: [competitionID]
            ),
            locale: locale
        )
    }

    static func events(forEventType eventTypeID: Int, isInPlay: Bool? = nil, locale: Locale) -> SearchRequest {
        events(forEventTypes: [eventTypeID], isInPlay: isInPlay, locale: locale)
    }

    static func events(forEventTypes eventTypeIDs: [Int], isInPlay: Bool? = nil, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Self.eventFacet,
            filter: FilterQuery(
                eventTypeIDs: eventTypeIDs,
                turnInPlayEnabled: isInPlay == true ? true : nil,
                marketStartingBefore:
                    isInPlay == true ? Date().addingTimeInterval(30) : Date().addingTimeInterval(60 * 24),
                marketLevels: isInPlay == true ? nil : nil
            ),
            locale: locale
        )
    }

    static func events(forMarket marketID: String, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Self.eventFacet,
            filter: FilterQuery(
                marketIDs: [marketID],
                maxResults: 0
            ),
            locale: locale
        )
    }

}

private extension SearchRequest {

    static var eventFacet: Facet {
        Facet(
            type: .event,
            next: Facet(
                type: .inPlay,
                next: Facet(
                    type: .canTurnInPlay
                )
            )
        )
    }

}
