import Sportsbook
import Vapor

extension MenuItem {

    static func featured(on request: Request) -> EventLoopFuture<[MenuItem]> {
        request.cmsContentService.fetchFeatured()
            .mapEach(MenuItem.init)
    }

    static func popular(on request: Request) -> EventLoopFuture<[MenuItem]> {
        request.cmsContentService.fetchPopular()
            .mapEach(MenuItem.init)
    }

}
