import GraphiQLVapor
import GraphQLKit
import Vapor

func routes(_ app: Application) throws {
    let protected = app.grouped(UserAuthenticator())
        .grouped(User.guardMiddleware())

    try protected.group("v1") { api in
        try api.register(collection: EventTypesController())
        try api.register(collection: CompetitionsController())
        try api.register(collection: EventsController())
        try api.register(collection: MarketsController())
        try api.register(collection: MarketPricesController())
        try api.register(collection: CMSController())
    }

    let graphQLSchema = try buildGraphQLSchema()
    app.register(graphQLSchema: graphQLSchema, withResolver: Resolver())

    // Enable GraphiQL web page to send queries to the GraphQL endpoint.
    // if !app.environment.isRelease {
    app.enableGraphiQL(on: "explorer")
}
