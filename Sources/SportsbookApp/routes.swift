import Vapor

func routes(_ app: Application) throws {
    let protected = app.grouped(UserAuthenticator())
        .grouped(User.guardMiddleware())

    let api = protected.grouped("api")

    try api.group("v1") { v1 in
        try v1.register(collection: SportsController())
        try v1.register(collection: CompetitionsController())
        try v1.register(collection: EventsController())
        try v1.register(collection: MarketsController())
        try v1.register(collection: MarketPricesController())
    }
}
