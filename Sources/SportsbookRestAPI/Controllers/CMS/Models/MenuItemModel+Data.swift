import Sportsbook
import Vapor

extension MenuItemModel {

    static func featured(on request: Request) -> EventLoopFuture<[MenuItemModel]> {
        request.cmsContentService.fetchFeatured()
            .mapEach(MenuItemModel.init)
    }

}
