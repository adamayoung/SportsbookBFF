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

        try v1.group("bff") { bff in
            try bff.register(collection: BFFHomeController())
            try bff.register(collection: BFFSportHomeController())
        }
    }
}
