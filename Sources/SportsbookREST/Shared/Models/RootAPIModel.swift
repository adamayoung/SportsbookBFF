import Vapor

struct RootAPIModel<ModelData: Content & Equatable>: Equatable, Content {

    let data: ModelData

    init(data: ModelData) {
        self.data = data
    }

}
