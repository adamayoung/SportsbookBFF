import Vapor

public protocol CMSClient {

    func get<Response: Decodable>(_ path: String, configuration: CMSConfiguration) async throws -> Response

}
