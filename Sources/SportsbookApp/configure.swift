import SportsbookCore
import Vapor

public func configure(_ app: Application) throws {
    try modules(app)
    try routes(app)
}

private func modules(_ app: Application) throws {
    try SportsbookCore.configure(app)
}

struct PrintHello: LifecycleHandler {

}
