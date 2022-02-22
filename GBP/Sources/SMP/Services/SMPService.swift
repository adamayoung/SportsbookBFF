import Foundation

/// SMP - Sportsbook Market Prices service.
/// Provides the most updated Sportsbook price information for each betting outcome.
public protocol SMPService {

    /// Retrieves market prices for a given set of market identifiers, asychronously.
    ///
    /// - Parameter marketIDs:The market identifiers to request prices for.
    /// - Parameter maxResults: The maximum number of results to return (Default: no maximum).
    ///
    /// - Returns: Market prices for the markets requested for.
    func marketPrices(forMarkets marketIDs: [String], maxResults: Int?) async throws -> [MarketDetails]

}

extension SMPService {

    public func marketPrices(forMarkets marketIDs: [String], maxResults: Int? = nil) async throws -> [MarketDetails] {
        try await marketPrices(forMarkets: marketIDs, maxResults: maxResults)
    }

    /// Retrieves market prices for a given market identifier, asychronously.
    ///
    /// - Parameter marketID:The market identifier to request prices for.
    /// - Parameter maxResults: The maximum number of results to return (Default: no maximum).
    ///
    /// - Returns: Market prices for the market requested for.
    public func marketPrices(forMarket marketID: String, maxResults: Int? = nil) async throws -> MarketDetails? {
        try await marketPrices(forMarkets: [marketID]).first
    }

}
