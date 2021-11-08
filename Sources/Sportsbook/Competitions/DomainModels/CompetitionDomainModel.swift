import Foundation

public struct CompetitionDomainModel: Identifiable, Equatable, Hashable, Comparable, Codable {

    public let id: Int
    public let name: String
    public let eventTypeID: Int

    public init(id: Int, name: String, eventTypeID: Int) {
        self.id = id
        self.name = name
        self.eventTypeID = eventTypeID
    }

    public static func < (lhs: CompetitionDomainModel, rhs: CompetitionDomainModel) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}
