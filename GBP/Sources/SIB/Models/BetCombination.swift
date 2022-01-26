import Foundation

public struct BetCombination: Codable {

    public let betType: BetType
    public let legCombinations: [LegCombination]
    public let canPlaceEachwayBet: Bool
    public let numLines: Int
    public let betMinStake: Double
    public let betMaxStake: Double
    public let eachwayBetMaxStake: Double?
    public let winAvgOdds: Odds
    public let originalWinAvgOdds: Odds?
    public let eachwayAvgOdds: Odds?
    public let accaInsuranceOffer: [AccaInsuranceOffer]?
    public let applicablePromotions: [String]?
    public let priceOverlay: PriceOverlay?
    public let hasCashout: Bool?
    public let hasEWCashout: Bool?
    public let hasBPE: Bool?
    public let combinationGroup: Double?
    public let isSGM: Bool?
    public let betMaxPayout: Double
    public let betMinStakeIncrement: Double?
    public let betMinStakeIncrementAsSystemBet: Double?
    public let availableEdges: [Edge]?
    public let edgeOffers: [EdgeOffer]?
    public let bonusWalletConditions: [BonusWalletCondition]?
    public let hasBonusMoney: Bool?
    public let betReference: String?
    public let availableOptions: [OptionType]?

    public init(betType: BetType, legCombinations: [LegCombination], canPlaceEachwayBet: Bool, numLines: Int,
                betMinStake: Double, betMaxStake: Double, eachwayBetMaxStake: Double? = nil, winAvgOdds: Odds,
                originalWinAvgOdds: Odds? = nil, eachwayAvgOdds: Odds? = nil,
                accaInsuranceOffer: [AccaInsuranceOffer]? = nil, applicablePromotions: [String]? = nil,
                priceOverlay: PriceOverlay? = nil, hasCashout: Bool? = nil, hasEWCashout: Bool? = nil,
                hasBPE: Bool? = nil, combinationGroup: Double? = nil, isSGM: Bool? = nil, betMaxPayout: Double,
                betMinStakeIncrement: Double? = nil, betMinStakeIncrementAsSystemBet: Double? = nil,
                availableEdges: [Edge]? = nil, edgeOffers: [EdgeOffer]? = nil,
                bonusWalletConditions: [BonusWalletCondition]? = nil, hasBonusMoney: Bool? = nil,
                betReference: String? = nil, availableOptions: [OptionType]? = nil) {
        self.betType = betType
        self.legCombinations = legCombinations
        self.canPlaceEachwayBet = canPlaceEachwayBet
        self.numLines = numLines
        self.betMinStake = betMinStake
        self.betMaxStake = betMaxStake
        self.eachwayBetMaxStake = eachwayBetMaxStake
        self.winAvgOdds = winAvgOdds
        self.originalWinAvgOdds = originalWinAvgOdds
        self.eachwayAvgOdds = eachwayAvgOdds
        self.accaInsuranceOffer = accaInsuranceOffer
        self.applicablePromotions = applicablePromotions
        self.priceOverlay = priceOverlay
        self.hasCashout = hasCashout
        self.hasEWCashout = hasEWCashout
        self.hasBPE = hasBPE
        self.combinationGroup = combinationGroup
        self.isSGM = isSGM
        self.betMaxPayout = betMaxPayout
        self.betMinStakeIncrement = betMinStakeIncrement
        self.betMinStakeIncrementAsSystemBet = betMinStakeIncrementAsSystemBet
        self.availableEdges = availableEdges
        self.edgeOffers = edgeOffers
        self.bonusWalletConditions = bonusWalletConditions
        self.hasBonusMoney = hasBonusMoney
        self.betReference = betReference
        self.availableOptions = availableOptions
    }

}
