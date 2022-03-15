import Foundation

struct CompetitionDomainModel: Identifiable, Equatable, Hashable, Comparable {

    let id: Int
    let name: String
    let sportID: Int

    init(id: Int, name: String, sportID: Int) {
        self.id = id
        self.name = name
        self.sportID = sportID
    }

    static func < (lhs: CompetitionDomainModel, rhs: CompetitionDomainModel) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}
