import Foundation
import SCAN

extension SearchRequest {

    static func event(withID eventID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Self.eventFacet,
            filter: SearchFilter(
                eventIds: [eventID],
                maxResults: 1
            ),
            locale: locale
        )
    }

    static func events(forCompetition competitionID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Self.eventFacet,
            filter: SearchFilter(
                competitionIds: [competitionID],
                maxResults: 0
            ),
            locale: locale
        )
    }

    static func events(forEventType eventTypeID: Int, isInPlay: Bool? = nil, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Self.eventFacet,
            filter: SearchFilter(
                eventTypeIds: [eventTypeID],
                turnInPlayEnabled: isInPlay == true ? true : nil,
                marketStartingBefore: isInPlay == true ? Date().addingTimeInterval(30) : nil,
                marketLevels: isInPlay == true ? [.avbEvent] : nil
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
