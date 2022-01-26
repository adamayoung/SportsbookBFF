import Foundation

/// SMP - Sportsbook Market Prices service.
/// Sports Event Catalogue exposure to the customer. Provides the most updated Sportsbook price information for each betting outcome.
public protocol SMPService {

    func search() async throws

}
