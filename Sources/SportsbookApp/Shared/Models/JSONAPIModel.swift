import Vapor

struct JSONAPIModel<ModelData: Content & Equatable>: Equatable, Content {

    let data: ModelData

    init(data: ModelData) {
        self.data = data
    }

}
