import Vapor

struct CMSClient: CMSClientProvider {

    private let client: Client
    private let decoder: JSONDecoder
    private let logger: Logger

    init(client: Client, decoder: JSONDecoder, logger: Logger) {
        self.client = client
        self.decoder = decoder
        self.logger = logger
    }

    func get<Response: Decodable>(_ path: String, configuration: CMSConfigurationProviding) async throws -> Response {
        let uri: URI = "\(configuration.baseURL)\(path)"
        let headers = Self.headers(using: configuration)

        let response: ClientResponse
        do {
            response = try await client.get(uri, headers: headers)
        } catch {
            logger.warning("Failed to connect to CMS",
                           metadata: ["client-error": .stringConvertible(error.localizedDescription)])
            throw Abort(.badGateway, reason: "Failed to connect to CMS.", identifier: "CMSCORE0001")
        }

        guard response.status == .ok else {
            logger.warning("Received invalid response from CMS",
                           metadata: ["response": .stringConvertible(response.description)])
            throw Abort(.badGateway, reason: "Received invalid response from CMS.", identifier: "CMSCORE0002")
        }

        do {
            return try response.content.decode(Response.self, using: decoder)
        } catch let error {
            let content: String
            if var body = response.body {
                content = body.readString(length: body.readableBytes) ?? ""
            } else {
                content = ""
            }

            logger.warning(
                "Failed to parse data from CMS",
                metadata: [
                    "body": .stringConvertible(content),
                    "decode-error": .stringConvertible(error.localizedDescription)
                ]
            )
            throw Abort(.badGateway, reason: "Failed to parse data from CMS.", identifier: "CMSCORE0003")
        }
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
