import Foundation

public struct CompetitionDomainModel: Identifiable, Equatable, Hashable, Comparable {

    public let id: Int
    public let name: String
    public let sportID: Int

    public init(id: Int, name: String, sportID: Int) {
        self.id = id
        self.name = name
        self.sportID = sportID
    }

    public static func < (lhs: CompetitionDomainModel, rhs: CompetitionDomainModel) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}
