import Vapor

extension Highlight {

    static func all(on request: Request) async throws -> [Highlight] {
        let sports = try await request.sports.popular(locale: request.locale)
        let sportIDs = sports.map(\.id)
        let events = try await request.events.all(forSports: sportIDs, isInPlay: true, locale: request.locale)
        let eventIDs = events.values.flatMap { $0 }.map(\.id)
        let markets = try await request.markets.all(forEvents: eventIDs, locale: request.locale)

        let highlights = sports.compactMap { sport -> Highlight? in
            guard let events = events[sport.id]?.compactMap(Event.init), !events.isEmpty else {
                return nil
            }

            var marketsDict = [Event.ID: [Market]]()
            events.map(\.id).forEach { eventID in
                guard let marketModels = markets[eventID], !marketModels.isEmpty else {
                    return
                }

                marketsDict[eventID] = marketModels.map(Market.init)
            }

            let sport = Sport(sport: sport)
            return Highlight(sport: sport, events: events, markets: marketsDict)
        }

        return highlights
    }

}
