import SportsbookCore
import Vapor

extension MenuItem {

    static func featured(on request: Request) async throws -> [MenuItem] {
        try await request.cmsContentService.featured()
            .map(MenuItem.init)
    }

    static func popular(on request: Request) async throws -> [MenuItem] {
        try await request.cmsContentService.popular()
            .map(MenuItem.init)
    }

}
