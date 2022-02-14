import Vapor

extension RoutesBuilder {

    public func registerSportsbookAPI() throws {
        try register(collection: EventTypesController())
        try register(collection: CompetitionsController())
        try register(collection: EventsController())
        try register(collection: MarketsController())
        try register(collection: MarketPricesController())
        try register(collection: CMSController())
    }

}
