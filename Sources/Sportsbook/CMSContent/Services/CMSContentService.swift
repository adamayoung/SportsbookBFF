import Foundation
import NIO

public protocol CMSContentService {

    func fetchFeatured() -> EventLoopFuture<[CMSNode]>

}
