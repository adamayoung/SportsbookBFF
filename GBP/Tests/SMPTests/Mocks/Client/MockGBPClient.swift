import Foundation
import GBPCore
import Vapor

final class MockGBPClient: GBPClient {

    var result: Result<Any, Error>?
    var lastPath: String?
    var lastConfiguration: TLAConfiguration?
    var lastBody: Any?

    func get<Response: Decodable>(_ path: String, configuration: TLAConfiguration) async throws -> Response {
        lastPath = path
        lastConfiguration = configuration

        guard let result = result else {
            throw MockGBPClientError(message: "No result set.")
        }

        do {
            guard let value = try result.get() as? Response else {
                throw MockGBPClientError(message: "Can't cast response to type \(String(describing: Response.self))")
            }

            return value
        } catch let error {
            throw error
        }
    }

    func post<Body: Content, Response: Decodable>(_ path: String, body: Body,
                                                  configuration: TLAConfiguration) async throws -> Response {
        lastPath = path
        lastBody = body
        lastConfiguration = configuration

        guard let result = result else {
            throw MockGBPClientError(message: "No result set.")
        }

        do {
            guard let value = try result.get() as? Response else {
                throw MockGBPClientError(message: "Can't cast response to type \(String(describing: Response.self))")
            }

            return value
        } catch let error {
            throw error
        }
    }

}

struct MockGBPClientError: Error {

    let message: String

}
