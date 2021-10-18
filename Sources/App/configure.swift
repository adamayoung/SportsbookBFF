import SportsbookGraphQL
import SportsbookRestAPI
import Vapor

public func configure(_ app: Application) throws {
    try SportsbookRestAPI.configure(app, at: "v1")
    try SportsbookGraphQL.configure(app)
}
