import Vapor

protocol TLAConfiguration {

    var environment: TLAEnvironment { get }
    var key: String? { get }

    var uri: URI { get }

    func additionalHeaders() throws -> HTTPHeaders

}

extension TLAConfiguration {

    func additionalHeaders() throws -> HTTPHeaders {
        var headers = HTTPHeaders()

        switch environment {
        case .ispQACore:
            guard let tlaKey = self.key else {
                var abort = Abort(.unauthorized)
                abort.reason = "Missing TLA key"
                throw abort
            }

            headers.add(name: .ispTLAHeader, value: tlaKey)

        default:
            break
        }

        return headers
    }

}
