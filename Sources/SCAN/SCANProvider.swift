import Foundation

/// SCAN - Sports Catalogue Navigator Service.
/// Reads up and exposes the Sports Catalogue to channels (including the website), APIs, and internal apps.
///
/// - Note: [Sports Catalogue Navigator Service](https://tools.skybet.net/confluence/display/GSTP/SCAN+-+Sports+Catalogue+Navigator+Service)
public protocol SCANProvider {

    var configuration: SCANConfiguration? { get nonmutating set }

    /// Performs a search request on SCAN.
    ///
    /// - Parameters:
    ///   - searchRequest: The SCAN search request.
    ///
    /// - Returns: A future that will receive the eventual search response.
    func search(_ searchRequest: SearchRequest) async throws -> FacetedSearchResult

}
