import Foundation

public struct Competition: Identifiable, Equatable, Codable {

    public let id: Int
    public let name: String
    public let sportID: Int

    public init(id: Int, name: String, sportID: Int) {
        self.id = id
        self.name = name
        self.sportID = sportID
    }

}
