import Foundation

enum CMSEnvironment: String, CaseIterable {

    case ppbProd = "PPB_PROD"
    case ispQACore = "ISP_QACORE"
    case ispQR = "ISP_QR"
    case ispProd = "ISP_PROD"

    static var `default`: CMSEnvironment {
        .ispQACore
    }

}
