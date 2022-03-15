import Vapor

struct MarketPricesController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let markets = routes.grouped("markets")
        markets.group(":marketID") { market in
            market.get("price", use: showForMarket)
        }
    }

    func showForMarket(request: Request) async throws -> RootAPIModel<MarketPrice> {
        guard let marketID = request.parameters.get("marketID") else {
            throw Abort(.notFound)
        }

        guard
            let market = try await Market.find(marketID, on: request),
            let marketPrice = try await market.price(on: request)
        else {
            throw Abort(.notFound)
        }

        return RootAPIModel(data: marketPrice)
    }

}
