import Foundation
@testable import SMP

extension MarketDetails {

    static var mock = MarketDetails(
        marketId: "501.16147765",
        marketStatus: .open,
        turnInPlayEnabled: true,
        inplay: true,
        bspMarket: false,
        livePriceAvailable: true,
        guaranteedPriceAvailable: false,
        bettingType: .fixedOdds,
        runnerDetails: [
            RunnerDetails(
                selectionId: 6910328,
                runnerOrder: 5100,
                winRunnerOdds: Odds(
                    trueOdds: TrueOdds(
                        decimalOdds: DecimalOdds(
                            decimalOdds: 501.0
                        ),
                        fractionalOdds: FractionalOdds(
                            numerator: 500,
                            denominator: 1
                        )
                    ),
                    decimalDisplayOdds: DecimalOdds(
                        decimalOdds: 501.0
                    ),
                    fractionalDisplayOdds: FractionalOdds(
                        numerator: 500,
                        denominator: 1
                    )
                ),
                eachwayRunnerOdds: nil,
                previousWinRunnerOdds: [
                    Odds(
                        trueOdds: TrueOdds(
                            decimalOdds: DecimalOdds(
                                decimalOdds: 426.0
                            ),
                            fractionalOdds: FractionalOdds(
                                numerator: 425,
                                denominator: 1
                            )
                        ),
                        decimalDisplayOdds: DecimalOdds(
                            decimalOdds: 426.0
                        ),
                        fractionalDisplayOdds: FractionalOdds(
                            numerator: 425,
                            denominator: 1
                        )
                    )
                ],
                handicap: 0.0,
                runnerStatus: .active,
                priceOverlay: nil,
                runnerScope: nil
            )
        ],
        eachwayAvailable: false,
        numberOfPlaces: nil,
        placeFraction: nil,
        legTypes: [
            .simpleSelection
        ],
        hasBPE: false,
        hasSGM: false,
        linkedMarketId: nil,
        betDelay: 3,
        rule4Deductions: []
    )

}
