import Vapor

struct GBPConfiguration {

    let environment: GBPEnvironment
    let tlaKey: String?

    var environmentName: String {
        environment.rawValue
    }

    init(environment: GBPEnvironment, tlaKey: String?) {
        self.environment = environment
        self.tlaKey = tlaKey
    }

    func headers() throws -> HTTPHeaders {
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
