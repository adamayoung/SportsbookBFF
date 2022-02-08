import Foundation

public protocol CMSContentService {

    func featured() async throws -> [CMSNodeDomainModel]

    func popular() async throws -> [CMSNodeDomainModel]

}
