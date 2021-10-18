import Foundation
import NIO

/// FBR - Fixed Odds Bet Reporting service.
/// Allows customers to access their open / settled / cash out eligible bets.
public protocol FBRService {

    func search() -> EventLoopFuture<Void>

}
