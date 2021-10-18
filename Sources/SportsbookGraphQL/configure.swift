import GraphiQLVapor
import GraphQLKit
import Sportsbook
import Vapor

public func configure(_ app: Application, at path: PathComponent = "graphql") throws {
    try modules(app)

    let graphQLSchema = try buildGraphQLSchema()
    app.register(graphQLSchema: graphQLSchema, withResolver: Resolver(), at: path)

    // Enable GraphiQL web page to send queries to the GraphQL endpoint.
    // if !app.environment.isRelease {
    app.enableGraphiQL(on: path, "explorer")
    // }
}

private func modules(_ app: Application) throws {
    try Sportsbook.configure(app)
}
