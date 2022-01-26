import Foundation

/// SIB - Sportsbook Imply Bets service.
/// Construction of dynamic betting opportunities (including bet types like Same Game multiples).
public protocol SIBService {

    func implyBets(request: ImplyBetsRequestRepresentable) async throws -> ImpyBetsResponse

}
