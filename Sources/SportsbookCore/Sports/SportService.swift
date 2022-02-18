import Foundation

public protocol SportService {

    func sport(withID id: SportDomainModel.ID) async throws -> SportDomainModel?

    func sports(filter: SportsFilterConvertible?) async throws -> [SportDomainModel]

}

extension SportService {

    public func fetchSports() async throws -> [SportDomainModel] {
        try await sports(filter: nil)
    }

}
