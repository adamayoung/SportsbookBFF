import Foundation

public enum CMSNodeType: String, Codable {

    case eventType = "SPORT"
    case competition = "COMPETITION"
    case event = "EVENT"
    case staticBanner = "STATIC_BANNER"
    case dynamicBanner = "DYNAMIC_BANNER"
    case marketType = "MARKET_TYPE"

}
