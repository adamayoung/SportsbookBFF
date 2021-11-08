import Foundation
import NIO

public protocol CMSContentService {

    func fetchFeatured() -> EventLoopFuture<[CMSNodeDomainModel]>

    func fetchPopular() -> EventLoopFuture<[CMSNodeDomainModel]>

}
