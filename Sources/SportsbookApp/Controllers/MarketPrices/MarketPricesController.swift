import Vapor

public struct MarketPricesController: RouteCollection {

    public init() { }

    public func boot(routes: RoutesBuilder) throws {
        let markets = routes.grouped("markets")
        markets.group(":marketID") { market in
            market.get("price", use: showForMarket)
        }
    }

    func showForMarket(request: Request) async throws -> RootAPIModel<MarketPrice> {
        guard let marketID = request.parameters.get("marketID") else {
            throw Abort(.badRequest)
        }

        guard let marketPrice = try await MarketPrice.find(forMarket: marketID, on: request) else {
            throw Abort(.notFound)
        }

        let model = RootAPIModel(data: marketPrice)
        return model
    }

}
