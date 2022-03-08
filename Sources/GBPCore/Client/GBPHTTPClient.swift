import Vapor

struct GBPHTTPClient: GBPClient {

    private static let userAgent = "SportsbookBFF"

    private let client: Client
    private let apiKey: String
    private let decoder: JSONDecoder
    private let logger: Logger

    init(client: Client, apiKey: String, decoder: JSONDecoder, logger: Logger) {
        self.client = client.logging(to: logger)
        self.apiKey = apiKey
        self.decoder = decoder
        self.logger = logger
    }

    func get<Response: Decodable>(_ path: String, configuration: TLAConfiguration) async throws -> Response {
        let uri: URI = "\(configuration.baseURL)\(path)"
        let headers = Self.headers(using: apiKey)

        let response = try await client.get(uri, headers: headers)

        guard response.status == .ok else {
            throw Abort(response.status)
        }

        return try response.content.decode(Response.self, using: decoder)
    }

    func post<Body: Content, Response: Decodable>(_ path: String, body: Body,
                                                  configuration: TLAConfiguration) async throws -> Response {
        let uri: URI = "\(configuration.baseURL)\(path)"
        var headers = Self.headers(using: apiKey)
        headers.add(name: .contentType, value: "application/json")

        let response = try await client.post(uri, headers: headers) { clientRequest in
            try clientRequest.content.encode(body)
        }

        guard response.status == .ok else {
            throw Abort(response.status)
        }

        return try response.content.decode(Response.self, using: decoder)
    }

}

extension GBPHTTPClient {

    private static func headers(using apiKey: String) -> HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(name: .accept, value: "application/json")
        headers.add(name: .userAgent, value: Self.userAgent)
        headers.add(name: .ispTLAHeader, value: apiKey)
        return headers
    }

}
