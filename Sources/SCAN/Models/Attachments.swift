import Foundation

public struct Attachments: Equatable, Codable {

    public let eventTypes: [String: EventTypeAttachment]?
    public let sportsBookMarkets: [String: MarketAttachment]?
    public let events: [String: EventAttachment]?
    public let competitions: [String: CompetitionAttachment]?

    public init(eventTypes: [String: EventTypeAttachment]? = nil,
                sportsBookMarkets: [String: MarketAttachment]? = nil, events: [String: EventAttachment]? = nil,
                competitions: [String: CompetitionAttachment]? = nil) {
        self.eventTypes = eventTypes
        self.sportsBookMarkets = sportsBookMarkets
        self.events = events
        self.competitions = competitions
    }

}
