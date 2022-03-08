import Vapor

struct CMSHTTPClient: CMSClient {

    private let client: Client
    private let decoder: JSONDecoder
    private let logger: Logger

    init(client: Client, decoder: JSONDecoder, logger: Logger) {
        self.client = client.logging(to: logger)
        self.decoder = decoder
        self.logger = logger
    }

    func get<Response: Decodable>(_ path: String, configuration: CMSConfiguration) async throws -> Response {
        let uri: URI = "\(configuration.baseURL)\(path)"
        let headers = Self.headers(using: configuration)

        let response = try await client.get(uri, headers: headers)

        guard response.status == .ok else {
            throw Abort(response.status)
        }

        return try response.content.decode(Response.self, using: decoder)
    }

}

extension CMSHTTPClient {

    private static func headers(using configuration: CMSConfiguration) -> HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(name: .accept, value: "application/json")
        headers.add(name: .secret, value: configuration.apiKey)
        return headers
    }

}
