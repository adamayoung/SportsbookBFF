import Foundation

/// FBR - Fixed Odds Bet Reporting service.
/// Allows customers to access their open / settled / cash out eligible bets.
public protocol FBRService {

    func search() async throws

}
