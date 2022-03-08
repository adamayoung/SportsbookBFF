import Foundation
import GBPCore

struct SMPConfiguration: TLAConfiguration, Equatable {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

}
