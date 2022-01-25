import Foundation
import GBP

extension SearchRequest {

    static func eventType(withID id: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .eventType),
            filter: SearchFilter(
                eventTypeIds: [id],
                maxResults: 1
            ),
            locale: locale
        )
    }

    static func allEventTypes(locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .eventType),
            filter: SearchFilter(
                productTypes: [.sportsbook],
                contentGroup: ContentGroup(language: "en", regionCode: "UK"),
                maxResults: 0
            ),
            locale: locale
        )
    }

}
