import SportsbookCore
import Vapor

extension Runner {

    static func all(forMarket marketID: String, on request: Request) async throws -> [Runner]? {
        guard let market = try await request.marketService.fetchMarket(withID: marketID) else {
            return nil
        }

        return market.runners.map(Runner.init)
    }

    static func find(withSelection selectionID: Int, inMarket marketID: String,
                     on request: Request) async throws -> Runner? {
        try await all(forMarket: marketID, on: request)?
            .first { $0.selectionID == selectionID }
    }

}
