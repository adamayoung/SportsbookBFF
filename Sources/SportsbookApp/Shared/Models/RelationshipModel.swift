import Vapor

struct RelationshipModel<ModelData: Codable & Equatable>: Equatable, Codable {

    let data: ModelData

    init(data: ModelData) {
        self.data = data
    }

}
