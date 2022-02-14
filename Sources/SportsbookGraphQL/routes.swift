import GraphiQLVapor
import GraphQLKit
import Vapor

extension RoutesBuilder {

    public func registerSportsbookGraphQL() throws {
        let graphQLSchema = try buildGraphQLSchema()
        register(graphQLSchema: graphQLSchema, withResolver: Resolver())

        // Enable GraphiQL web page to send queries to the GraphQL endpoint.
        // if !app.environment.isRelease {

        if let app = self as? Application {
            app.enableGraphiQL(on: "explorer")
        }
    }

}
