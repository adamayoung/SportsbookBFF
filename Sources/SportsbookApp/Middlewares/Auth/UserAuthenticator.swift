import Vapor

struct UserAuthenticator: BearerAuthenticator {

    typealias User = SportsbookApp.User

    func authenticate(bearer: BearerAuthorization, for request: Request) -> EventLoopFuture<Void> {
        guard let authKey = Environment.get("AUTH_KEY") else {
            request.auth.login(User(name: "Unauthenticated user"))
            return request.eventLoop.makeSucceededFuture(())
        }

        if bearer.token == authKey {
            request.auth.login(User(name: "Test User"))
        }

        return request.eventLoop.makeSucceededFuture(())
    }
}
