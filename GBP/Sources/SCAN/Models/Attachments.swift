import Foundation

public struct Attachments: Codable {

    public let eventTypes: [String: EventTypeAttachment]?
    public let competitions: [String: CompetitionAttachment]?
    public let events: [String: EventAttachment]?
    public let sportsBookMarkets: [String: MarketAttachment]?

    public init(eventTypes: [String: EventTypeAttachment]? = nil, competitions: [String: CompetitionAttachment]? = nil,
                events: [String: EventAttachment]? = nil, sportsBookMarkets: [String: MarketAttachment]? = nil) {
        self.eventTypes = eventTypes
        self.competitions = competitions
        self.events = events
        self.sportsBookMarkets = sportsBookMarkets
    }

}
