import Foundation

public struct OpportunityDomainModel: Equatable, Hashable, Codable {

    public let type: OpportunityDomainModel.OpportunityType
    public let legs: [OpportunityLegDomainModel]
    public let status: Status
//    public let activeDetails: ActiveDetails?
    public let betReference: String?
    public let promotionType: String?
//    public let originalWinAvgOdds: OriginalWinAvgOdds?

}

extension OpportunityDomainModel {

    public enum OpportunityType: String, CaseIterable, Codable {
        case single
        case double
        case treble
        case fourFold
        case fiveFold
        case sixFold
        case sevenFold
        case eightFold
        case nineFold
        case tenFold
        case elevenFold
        case twelveFold
        case thirteenFold
        case fourteenFold
        case fifteenFold
        case sixteenFold
        case seventeenFold
        case eighteenFold
        case mineteenFold
        case twentyFold
        case twentyOneFold
        case twentyTwoFold
        case twentyThreeFold
        case twentyFourFold
        case twentyFiveFold
        case trixie
        case patent
        case yankee
        case canadian
        case heinz
        case superHeinz
        case goliath
        case lucky15
        case lucky31
        case lucky63
        case unknown
    }

}

extension OpportunityDomainModel {

    public enum Status: String, CaseIterable, Codable {
        case active
        case suspended
        case notFound
        case invalid
        case notAvailable
        case unknown
    }

}
