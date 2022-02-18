import SportsbookCore
import Vapor

public extension Runner {

    static func all(forMarket marketID: Market.ID, on request: Request) async throws -> [Runner]? {
        guard let market = try await request.marketService.market(withID: marketID) else {
            return nil
        }

        return market.runners.map(Runner.init)
    }

    static func find(withSelection selectionID: Runner.ID, inMarket marketID: Market.ID,
                     on request: Request) async throws -> Runner? {
        guard let market = try await request.marketService.market(withID: marketID) else {
            return nil
        }

        guard let runner = (market.runners.first { $0.selectionID == selectionID }) else {
            return nil
        }

        return Runner(runner: runner)
    }

}
