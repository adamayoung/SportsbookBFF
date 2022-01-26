import SportsbookCore
import Vapor

extension Market {

    static func all(forEvent eventID: Int, on request: Request) async throws -> [Market] {
        try await request.marketService.fetchMarkets(forEvent: eventID)
            .map(Market.init)
    }

    static func all(forEvent eventID: Int, on request: Request) -> EventLoopFuture<[Market]> {
        let promise = request.eventLoop.makePromise(of: [Market].self)
        promise.completeWithTask {
            try await all(forEvent: eventID, on: request)
        }

        return promise.futureResult
    }

    static func find(_ id: String, on request: Request) async throws -> Market? {
        guard let market = try await request.marketService.fetchMarket(withID: id) else {
            return nil
        }

        return Market(market: market)
    }

}
