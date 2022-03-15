import Vapor

struct CMSClient: CMSClientProvider {

    private let application: Application
    private var client: Client { application.client }
    private var decoder: JSONDecoder { application.cmsDecoder }

    init(application: Application) {
        self.application = application
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

extension Application {

    public var cmsClient: CMSClientProvider {
        CMSClient(application: self)
    }

}

extension Request {

    public var cmsClient: CMSClientProvider {
        CMSClient(application: application)
    }

}
