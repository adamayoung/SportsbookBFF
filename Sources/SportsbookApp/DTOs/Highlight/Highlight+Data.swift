// import Vapor
//
// extension HighlightDTO {
//
//    static func all(on request: Request) async throws -> [HighlightDTO] {
//        let sports = try await request.sports.popular(locale: request.locale)
//        let sportIDs = sports.map(\.id)
//        let events = try await request.events.all(forSports: sportIDs, isInPlay: true, locale: request.locale)
//        let eventIDs = events.values.flatMap { $0 }.map(\.id)
//        let markets = try await request.markets.all(forEvents: eventIDs, locale: request.locale)
//
//        let highlights = sports.compactMap { sport -> HighlightDTO? in
//            guard let events = events[sport.id]?.compactMap(EventDTO.init), !events.isEmpty else {
//                return nil
//            }
//
//            var marketsDict = [EventDTO.ID: [MarketDTO]]()
//            events.map(\.id).forEach { eventID in
//                guard let marketModels = markets[eventID], !marketModels.isEmpty else {
//                    return
//                }
//
//                marketsDict[eventID] = marketModels.map(MarketDTO.init)
//            }
//
//            let sport = SportDTO(sport: sport)
//            return HighlightDTO(sport: sport, events: events, markets: marketsDict)
//        }
//
//        return highlights
//    }
//
// }
