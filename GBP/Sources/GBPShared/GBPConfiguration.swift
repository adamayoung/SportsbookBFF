import Vapor

public struct GBPConfiguration {

    public let environment: GBPEnvironment
    public let tlaKey: String?

    public var environmentName: String {
        environment.rawValue
    }

    public init(environment: GBPEnvironment, tlaKey: String?) {
        self.environment = environment
        self.tlaKey = tlaKey
    }

    public func headers() throws -> HTTPHeaders {
        var headers = HTTPHeaders()

        guard let tlaKey = self.tlaKey else {
            var abort = Abort(.unauthorized)
            abort.reason = "Missing TLA key"
            throw abort
        }

        headers.add(name: .ispTLAHeader, value: tlaKey)

        return headers
    }

}
