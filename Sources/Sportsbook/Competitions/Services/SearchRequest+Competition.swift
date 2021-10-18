import Foundation
import GBP

extension SearchRequest {

    static func competitions(forEventType eventTypeID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .competition),
            filter: SearchFilter(
                eventTypeIds: [eventTypeID]
            ),
            locale: locale
        )
    }

    static func competition(withID competitionID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .competition),
            filter: SearchFilter(
                competitionIds: [competitionID]
            ),
            locale: locale
        )
    }

}
