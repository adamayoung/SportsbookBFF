import Vapor

func routes(_ app: Application, at path: PathComponent) throws {
    let protected = app.grouped(UserAuthenticator())
        .grouped(User.guardMiddleware())

    try protected.group(path) { api in
        try api.register(collection: EventTypesController())
        try api.register(collection: CompetitionsController())
        try api.register(collection: MarketsController())
        try api.register(collection: EventsController())
        try api.register(collection: CMSController())
    }
}
