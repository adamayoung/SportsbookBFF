import Graphiti
import SportsbookModels
import Vapor

// swiftlint:disable function_body_length
func buildGraphQLSchema() throws -> Schema<Resolver, Request> {
    try Schema<Resolver, Request> {
        DateScalar(formatter: ISO8601DateFormatter())

        Type(TimeZone.self) {
            Field("identifier", at: \.identifier)
        }

        Enum(MenuItem.MenuItemType.self)
        Enum(Sport.Category.self)

        Type(MenuItem.self) {
            Field("id", at: \.id)
            Field("name", at: \.name)
            Field("type", at: \.type)
            Field("sportID", at: \.sportID)
            Field("sportCategory", at: \.sportCategory)
            Field("weight", at: \.weight)
        }

        Type(FractionalOdds.self) {
            Field("numerator", at: \.numerator)
                .description("The numerator of a fractional representation of these odds.")
            Field("denominator", at: \.denominator)
                .description("The denominator of a fractional representation of these odds.")
        }

        Type(Odds.self) {
            Field("decimalOdds", at: \.decimalOdds)
                .description("The decimal representation of these odds with half round up 2 decimal places. This must "
                             + "not be used for calculations.")
            Field("fractionalOdds", at: \.fractionalOdds)
                .description("The fractional representation of these odds. This should be used for all needed "
                             + "calculations.")
        }

        Enum(RunnerDetails.Status.self)
        Enum(RunnerDetails.PriceOverlay.self)
        Enum(RunnerDetails.Scope.self)

        Type(RunnerDetails.self) {
            Field("selectionID", at: \.selectionID)
                .description("Unique selection identifier.")
            Field("order", at: \.order)
                .description("Allow for ordering runners on a market view.")
            Field("winOdds", at: \.winOdds)
                .description("Currently available odds to bet, e.g. 2/1 (fractional), 3.0 (decimal).")
            Field("eachwayOdds", at: \.eachwayOdds)
                .description("Currently available eachway average odds, this is a combination of the win and place "
                             + "odds(derived from the market place fraction and runner win odds) divided by the number "
                             + "of lines (2).")
            Field("previousWinOdds", at: \.previousWinOdds)
                .description("Previous odds of the runner, only to be used for display purposes only.")
            Field("handicap", at: \.handicap)
                .description("The handicap applied to the selection, if on an asian-style market.")
            Field("status", at: \.status)
                .description("The current state of a runner, e.g. ACTIVE or SUSPENDED.")
            Field("priceOverlay", at: \.priceOverlay)
                .description("The current state of a runner, e.g. ACTIVE or SUSPENDED.")
            Field("scope", at: \.scope)
                .description("The scope defines in which scope a runner is available for betting based on the market's "
                             + "in-play status. If present betting will be restricted to the indicated scope.")
        }

        Enum(MarketPrice.MarketBettingType.self)
        Enum(MarketPrice.MarketStatus.self)
        Enum(MarketPrice.LegType.self)

        Type(MarketPrice.self) {
            Field("marketID", at: \.marketID)
                .description("Unique market identifier in the format 'product.market'.")
            Field("marketStatus", at: \.marketStatus)
                .description("The current state of a market.")
            Field("turnInPlayEnabled", at: \.turnInPlayEnabled)
                .description("True if a market turns 'in play' at a kick off time, otherwise it is false.")
            Field("inPlay", at: \.inPlay)
                .description("True if a market is currently in play, otherwise it is false.")
            Field("bspMarket", at: \.bspMarket)
                .description("bspMarket")
            Field("livePriceAvailable", at: \.livePriceAvailable)
                .description("True if live prices are available on the market.")
            Field("guaranteedPriceAvailable", at: \.guaranteedPriceAvailable)
                .description("True if guaranteed price is available on this market.")
            Field("bettingType", at: \.bettingType)
                .description("Represents a type of a betting market.")
            Field("runnerDetails", at: \.runnerDetails)
                .description("Available runners of the market in no particular order.")
            Field("eachwayAvailable", at: \.eachwayAvailable)
                .description("True if eachway betting is available.")
            Field("numberOfPlaces", at: \.numberOfPlaces)
                .description("The number of places for a win market(each way).")
            Field("placeFraction", at: \.placeFraction)
                .description("The fraction to which the place price is derived(each way).")
            Field("leftTypes", at: \.legTypes)
                .description("Available Leg Types the user can place bets in this market.")
            Field("hasBPE", at: \.hasBPE)
                .description("Is this market BPE (Price Rush) eligible.")
            Field("hasSGM", at: \.hasSGM)
                .description("Is this market eligible for same game multiples?")
            Field("linkedMarketID", at: \.linkedMarketID)
                .description("Linked market identifier. Presented in the 'product.market' format.")
            Field("betDelay", at: \.betDelay)
                .description("The bet delay for a market.")
        }

        Enum(Runner.RunnerResult.RunnerResultType.self)

        Type(Runner.RunnerResult.self) {
            Field("type", at: \.type)
        }

        Enum(Runner.RunnerStatus.self)

        Type(Runner.self) {
            Field("selectionID", at: \.selectionID)
            Field("name", at: \.name)
            Field("handicap", at: \.handicap)
            Field("sortPriority", at: \.sortPriority)
            Field("status", at: \.status)
            Field("result", at: \.result)
        }

        Type(Market.self) {
            Field("id", at: \.id)
            Field("name", at: \.name)
            Field("marketDate", at: \.marketDate)
            Field("inPlay", at: \.inPlay)
            Field("canTurnInPlay", at: \.canTurnInPlay)
            Field("marketType", at: \.marketType)
            Field("runners", at: \.runners)
            Field("event", at: Market.event, as: TypeReference<Event>.self)
            Field("competition", at: Market.competition, as: TypeReference<Competition>.self)
            Field("sport", at: Market.sport, as: TypeReference<Sport>.self)
            Field("price", at: Market.price)
        }
        .description("A specific type or category of bet on a particular event.")

        Type(Event.self) {
            Field("id", at: \.id)
            Field("name", at: \.name)
            Field("countryCode", at: \.countryCode)
            Field("timeZone", at: \.timeZone)
            Field("openDate", at: \.openDate)
            Field("isVideoAvailable", at: \.isVideoAvailable)
            Field("isInPlay", at: \.isInPlay)
            Field("canTurnInPlay", at: \.canTurnInPlay)
            Field("markets", at: Event.markets) {
                Argument("id", at: \.id)
                Argument("marketType", at: \.marketType)
            }
            Field("competition", at: Event.competition, as: TypeReference<Competition>.self)
            Field("sport", at: Event.sport, as: TypeReference<Sport>.self)
        }
        .description("An event or contest in an event type.")

        Type(Competition.self) {
            Field("id", at: \.id)
            Field("name", at: \.name)
            Field("events", at: Competition.events) {
                Argument("id", at: \.id)
            }
            Field("sport", at: Competition.sport, as: TypeReference<Sport>.self)
        }
        .description("A competition in a particular event type.")

        Type(Sport.self) {
            Field("id", at: \.id)
            Field("name", at: \.name)
            Field("category", at: \.category)
            Field("competitions", at: Sport.competitions) {
                Argument("id", at: \.id)
            }
            Field("events", at: Sport.events) {
                Argument("id", at: \.id)
                Argument("isInPlay", at: \.isInPlay)
            }
        }
        .description("An event type.")

        Query {
            Field("sports", at: Resolver.fetchSports) {
                Argument("id", at: \.id)
                Argument("category", at: \.category)
            }

            Field("competitions", at: Resolver.fetchCompetitions) {
                Argument("id", at: \.id)
            }

            Field("events", at: Resolver.fetchEvents) {
                Argument("id", at: \.id)
            }

            Field("markets", at: Resolver.fetchMarkets) {
                Argument("id", at: \.id)
            }

            Field("featured", at: Resolver.fetchFeatured)

            Field("popular", at: Resolver.fetchPopular)
        }
    }
}
// swiftlint:enable function_body_length
