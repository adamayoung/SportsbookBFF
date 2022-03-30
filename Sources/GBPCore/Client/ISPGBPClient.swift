import Vapor

struct ISPGBPClient: GBPClient {

    private static let userAgent = "SportsbookBFF"

    private let client: Client
    private let decoder: JSONDecoder
    private let logger: Logger

    init(client: Client, decoder: JSONDecoder, logger: Logger) {
        self.client = client
        self.decoder = decoder
        self.logger = logger
    }

    func get<Response: Decodable>(_ path: String, configuration: TLAConfigurationProviding) async throws -> Response {
        let uri: URI = "\(configuration.baseURL)\(path)"
        let headers = Self.headers(using: configuration)

        let response: ClientResponse
        do {
            response = try await client.get(uri, headers: headers)
        } catch let error {
            logger.warning("Failed to connect to \(configuration.tlaName)",
                           metadata: ["client-error": .stringConvertible(error.localizedDescription)])
            throw Abort(.badGateway, reason: "Failed to connect to \(configuration.tlaName).",
                        identifier: "GBPCORE0001")
        }

        guard response.status == .ok else {
            logger.warning("Received invalid response from \(configuration.tlaName)",
                           metadata: ["response": .stringConvertible(response.description)])
            throw Abort(.badGateway, reason: "Received invalid response from \(configuration.tlaName).",
                        identifier: "GBPCORE0002")
        }

        do {
            return try response.content.decode(Response.self, using: decoder)
        } catch {
            let content: String
            if var body = response.body {
                content = body.readString(length: body.readableBytes) ?? ""
            } else {
                content = ""
            }

            logger.warning(
                "Failed to parse data from \(configuration.tlaName)",
                metadata: [
                    "body": .stringConvertible(content),
                    "decode-error": .stringConvertible(error.localizedDescription)
                ]
            )
            throw Abort(.badGateway, reason: "Failed to parse data from \(configuration.tlaName).",
                        identifier: "CMSCORE0003")
        }
    }

    func post<Body: Content, Response: Decodable>(_ path: String, body: Body,
                                                  configuration: TLAConfigurationProviding) async throws -> Response {
        let uri: URI = "\(configuration.baseURL)\(path)"
        var headers = Self.headers(using: configuration)
        headers.add(name: .contentType, value: "application/json")

        let response = try await client.post(uri, headers: headers) { clientRequest in
            try clientRequest.content.encode(body)
        }

        guard response.status == .ok else {
            throw Abort(.badGateway)
        }

        do {
            return try response.content.decode(Response.self, using: decoder)
        } catch let error {
            throw Abort(.badGateway, reason: error.localizedDescription)
        }
    }

}

extension ISPGBPClient {

    private static func headers(using configuration: TLAConfigurationProviding) -> HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(name: .accept, value: "application/json")
        headers.add(name: .userAgent, value: Self.userAgent)
        headers.add(name: .ispTLAHeader, value: configuration.apiKey)
        return headers
    }

}
