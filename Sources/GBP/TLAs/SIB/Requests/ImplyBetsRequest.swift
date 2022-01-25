import Foundation
import Vapor

/// List of valid fixed odds bets for a given set of market runners.
public struct ImplyBetsRequest: Equatable, Hashable, Content {

    /// A set of bet legs that the list of valid fixed odds bets is returned for. These returned bets could have multiple legs.
    public let betLegs: [BetLeg]
    /// Which kinds of bets to imply - singles, multiples, all (default is all).
    public let scope: ImplyBetsScope
    /// Which type of Price to return - normal or suggested price (default is normal). The suggested price may not be available for all legTypes.
    public let pricePolicy: PricePolicy
    /// Currency code.
    public let currency: String
    /// The language to render promotion details in.
    public let locale: String

    public init(betLegs: [BetLeg], scope: ImplyBetsScope = .all, pricePolicy: PricePolicy = .default, currency: String,
                locale: Locale) {
        self.betLegs = betLegs
        self.scope = scope
        self.pricePolicy = pricePolicy
        self.currency = currency
        self.locale = locale.identifier.uppercased()
    }

    public init(betLeg: BetLeg, scope: ImplyBetsScope = .all, pricePolicy: PricePolicy = .default, currency: String,
                locale: Locale) {
        self.init(betLegs: [betLeg], scope: scope, pricePolicy: pricePolicy, currency: currency, locale: locale)
    }

}

extension ImplyBetsRequest: ImplyBetsRequestRepresentable {

    public var implyBetsRequest: ImplyBetsRequest {
        self
    }

}
