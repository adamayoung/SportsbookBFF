import SportsbookGraphQL
import SportsbookREST
import Vapor

func routes(_ app: Application) throws {
    let protected = app.grouped(UserAuthenticator())
        .grouped(User.guardMiddleware())

    try protected.group("v1") { api in
        try api.registerSportsbookAPI()
    }

    try app.registerSportsbookGraphQL()
}
