import Foundation

enum TLAEnvironment: String, CaseIterable {

    case ppbProd = "PPB_PROD"
    case ispQACore = "ISP_QACORE"

    static var `default`: TLAEnvironment {
        .ispQACore
    }

}
