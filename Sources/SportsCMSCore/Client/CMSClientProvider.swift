import Vapor

public protocol CMSClientProvider {

    func get<Response: Decodable>(_ path: String, configuration: CMSConfigurationProviding) async throws -> Response

}
