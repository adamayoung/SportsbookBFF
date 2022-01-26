import SportsbookCore
import Vapor

extension MenuItem {

    static func featured(on request: Request) async throws -> [MenuItem] {
        try await request.cmsContentService.fetchFeatured()
            .map(MenuItem.init)
    }

    static func popular(on request: Request) async throws -> [MenuItem] {
        try await request.cmsContentService.fetchPopular()
            .map(MenuItem.init)
    }

}
