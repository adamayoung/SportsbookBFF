import Foundation

/// SMP - Sportsbook Market Prices service.
/// Sports Event Catalogue exposure to the customer. Provides the most updated Sportsbook price information for each betting outcome.
public protocol SMPService {

    /// Retrieves market details for a given set of market identifiers.
    func marketPrices(forMarkets marketIds: [String], maxResults: Int?) async throws -> [MarketPrice]

}

public extension SMPService {

    func marketPrices(forMarkets marketIds: [String], maxResults: Int? = nil) async throws -> [MarketPrice] {
        try await marketPrices(forMarkets: marketIds, maxResults: maxResults)
    }

    func marketPrices(forMarket marketId: String, maxResults: Int? = nil) async throws -> MarketPrice? {
        try await marketPrices(forMarkets: [marketId]).first
    }

}
