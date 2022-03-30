import Sportsbook
import Vapor

struct MarketPricesController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let markets = routes.grouped("markets")
        markets.group(":marketID") { market in
            market.get("price", use: showForMarket)
        }
    }

    func showForMarket(request: Request) async throws -> RootDTO<MarketPriceDTO> {
        guard
            let marketID = request.parameters.get("marketID"),
            let market = try await Market.find(marketID, on: request)
        else {
            throw Abort(.notFound, reason: "Market not found.")
        }

        guard let marketPrice = try await market.price(on: request) else {
            throw Abort(.notFound, reason: "Market price not found.")
        }

        let dto = MarketPriceDTO(marketPrice: marketPrice)
        return RootDTO(data: dto)
    }

}
