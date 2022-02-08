import Foundation

public enum AttachmentType: String, CaseIterable, Equatable, Hashable, Codable {

    case eventType = "EVENT_TYPE"
    case competition = "COMPETITION"
    case event = "EVENT"
    case market = "MARKET"
    case sportsbookMarket = "SPORTSBOOK_MARKET"
    case meeting = "MEETING"
    case race = "RACE"
    case marketLite = "MARKET_LITE"

}
