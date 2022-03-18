import Vapor

struct RootDTO<ModelData: Codable & Equatable>: Equatable, Content {

    let data: ModelData

    init(data: ModelData) {
        self.data = data
    }

}
