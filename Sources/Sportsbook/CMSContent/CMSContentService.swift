import Foundation

public protocol CMSContentService {

    func fetchFeatured() async throws -> [CMSNodeDomainModel]

    func fetchPopular() async throws -> [CMSNodeDomainModel]

}
