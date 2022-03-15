import Vapor

struct Competition: Identifiable, Equatable {

    let id: Int
    let name: String
    let sportID: Int

    init(id: Int, name: String, sportID: Int) {
        self.id = id
        self.name = name
        self.sportID = sportID
    }

}

extension Competition: Content { }
