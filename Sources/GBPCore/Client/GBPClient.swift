import Vapor

struct GBPClient: GBPClientProvider {

    private static let userAgent = "SportsbookBFF"

    private let application: Application

    init(application: Application) {
        self.application = application
    }

}

extension GBPClient {

    func get<Response: Decodable>(_ path: String, configuration: TLAConfigurationProviding) async throws -> Response {
        let uri: URI = "\(configuration.baseURL)\(path)"
        let headers = Self.headers(using: configuration)

        let response = try await application.client.get(uri, headers: headers)

        guard response.status == .ok else {
            throw Abort(response.status)
        }

        return try response.content.decode(Response.self, using: application.tlaDecoder)
    }

    func post<Body: Content, Response: Decodable>(_ path: String, body: Body,
                                                  configuration: TLAConfigurationProviding) async throws -> Response {
        let uri: URI = "\(configuration.baseURL)\(path)"
        var headers = Self.headers(using: configuration)
        headers.add(name: .contentType, value: "application/json")

        let response = try await application.client.post(uri, headers: headers) { clientRequest in
            try clientRequest.content.encode(body)
        }

        guard response.status == .ok else {
            throw Abort(response.status)
        }

        return try response.content.decode(Response.self, using: application.tlaDecoder)
    }

}

extension GBPClient {

    private static func headers(using configuration: TLAConfigurationProviding) -> HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(name: .accept, value: "application/json")
        headers.add(name: .userAgent, value: Self.userAgent)
        headers.add(name: .ispTLAHeader, value: configuration.apiKey)
        return headers
    }

}

extension Application {

    public var gbpClient: GBPClientProvider {
        GBPClient(application: self)
    }

}

extension Request {

    public var gbpClient: GBPClientProvider {
        GBPClient(application: application)
    }

}
