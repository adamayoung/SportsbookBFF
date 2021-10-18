import Graphiti
import Sportsbook
import Vapor

// swiftlint:disable function_body_length
func buildGraphQLSchema() throws -> Schema<Resolver, Request> {
    try Schema<Resolver, Request> {
        DateScalar(formatter: ISO8601DateFormatter())

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
            Field("eventType", at: Market.eventType, as: TypeReference<EventType>.self)
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
            }
            Field("competition", at: Event.competition, as: TypeReference<Competition>.self)
            Field("eventType", at: Event.eventType, as: TypeReference<EventType>.self)
        }
        .description("An event or contest in an event type.")

        Type(Competition.self) {
            Field("id", at: \.id)
            Field("name", at: \.name)
            Field("events", at: Competition.events) {
                Argument("id", at: \.id)
            }
            Field("eventType", at: Competition.eventType, as: TypeReference<EventType>.self)
        }
        .description("A competition in a particular event type.")

        Type(EventType.self) {
            Field("id", at: \.id)
            Field("name", at: \.name)
            Field("competitions", at: EventType.competitions) {
                Argument("id", at: \.id)
            }
            Field("events", at: EventType.events) {
                Argument("id", at: \.id)
                Argument("isInPlay", at: \.isInPlay)
            }
        }
        .description("A event type.")

        Query {
            Field("eventTypes", at: Resolver.fetchEventTypes) {
                Argument("id", at: \.id)
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
        }
    }
}
// swiftlint:enable function_body_length
