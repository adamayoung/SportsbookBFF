import Vapor

public protocol GBPClient {

    func get<Response: Decodable>(_ path: String, configuration: TLAConfigurationProviding) async throws -> Response

    func post<Body: Content, Response: Decodable>(_ path: String, body: Body,
                                                  configuration: TLAConfigurationProviding) async throws -> Response

}
