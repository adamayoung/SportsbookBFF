import Vapor

struct CMSClient: CMSClientProvider {

    private let client: Client
    private let decoder: JSONDecoder

    init(client: Client, decoder: JSONDecoder) {
        self.client = client
        self.decoder = decoder
    }

    func get<Response: Decodable>(_ path: String, configuration: CMSConfigurationProviding) async throws -> Response {
        let uri: URI = "\(configuration.baseURL)\(path)"
        let headers = Self.headers(using: configuration)

        let response = try await client.get(uri, headers: headers)

        guard response.status == .ok else {
            throw Abort(response.status)
        }

        return try response.content.decode(Response.self, using: decoder)
    }

}

extension CMSClient {

    private static func headers(using configuration: CMSConfigurationProviding) -> HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(name: .accept, value: "application/json")
        headers.add(name: .secret, value: configuration.apiKey)
        return headers
    }

}
