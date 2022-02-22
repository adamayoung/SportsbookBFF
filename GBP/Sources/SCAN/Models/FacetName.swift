import Foundation

public enum FacetName: String, Equatable, Hashable, Codable {

    case event = "EVENT"
    case eventType = "EVENT_TYPE"
    case marketType = "MARKET_TYPE"
    case venue = "VENUE"
    case marketBettingType = "MARKET_BETTING_TYPE"
    case competition = "COMPETITION"
    case meeting = "MEETING"
    case race = "RACE"
    case exchange = "EXCHANGE"
    case marketStartTime = "MARKET_START_TIME"
    case eventCountry = "EVENT_COUNTRY"
    case canTurnInPlay = "CAN_TURN_IN_PLAY"
    case bspMarket = "BSP_MARKET"
    case inPlay = "IN_PLAY"
    case sgmMarket = "SGM_MARKET"
    case market = "MARKET"
    case productType = "PRODUCT_TYPE"
    case competitionRegion = "COMPETITION_REGION"
    case raceStartTime = "RACE_START_TIME"
    case meetingStartTime = "MEETING_START_TIME"
    case marketLevel = "MARKET_LEVEL"
    case raceClass = "RACE_CLASS"
    case numberOfWinners = "NUMBER_OF_WINNERS"
    case raceType = "RACE_TYPE"
    case unknown = "UNKNOWN"

    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }

}
