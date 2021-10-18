import Foundation
import NIO

/// SIB - Sportsbook Imply Bets service.
/// Construction of dynamic betting opportunities (including bet types like Same Game multiples).
public protocol SIBService {

    func search() -> EventLoopFuture<Void>

}
