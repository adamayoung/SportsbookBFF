import Sportsbook
import Vapor

public func configure(_ app: Application, at path: PathComponent = "") throws {
    try modules(app)
    try routes(app, at: path)
}

private func modules(_ app: Application) throws {
    try Sportsbook.configure(app)
}
