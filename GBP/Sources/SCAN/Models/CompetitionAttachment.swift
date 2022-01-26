import Foundation
import Vapor

public struct CompetitionAttachment: Codable {

    public let key: String?
    public let name: String?
    public let competitionId: Int?
    public let region: String?
    public let eventTypeId: Int?
    public let oddsBoostCount: Int?

    public  init(key: String? = nil, name: String? = nil, competitionId: Int?, region: String? = nil,
                 eventTypeId: Int? = nil, oddsBoostCount: Int? = nil) {
        self.key = key
        self.name = name
        self.competitionId = competitionId
        self.region = region
        self.eventTypeId = eventTypeId
        self.oddsBoostCount = oddsBoostCount
    }

}
