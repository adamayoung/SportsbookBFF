import Foundation

public struct OpportunityLegDomainModel: Equatable, Hashable, Codable {

    public let marketID: String
    public let selectionID: String
    public let legType: OpportunityLegDomainModel.LegType?
    public let isBanker: Bool?
    public let hasSGM: Bool
    public let handicap: Int?

}

extension OpportunityLegDomainModel {

    public enum LegType: String, CaseIterable, Codable {
        case simpleSelection
        case forecast
        case reverseForecast
        case combinationForecase
        case tricast
        case combinationTricast
        case scorecast
        case wincast
        case oneLineBet
        case unknown
    }

}
