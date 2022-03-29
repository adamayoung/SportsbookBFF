import Foundation

struct SportHomeDTO: Equatable, Codable {

    let sport: SportDTO
    let inPlay: [CompetitionEventsDTO]
    let competitions: [CompetitionDTO]

    init(sport: SportDTO, inPlay: [CompetitionEventsDTO], competitions: [CompetitionDTO]) {
        self.sport = sport
        self.inPlay = inPlay
        self.competitions = competitions
    }

}

extension SportHomeDTO {

    struct CompetitionEventsDTO: Equatable, Codable {
        let competition: CompetitionDTO
        let events: [EventDTO]

        init(competition: CompetitionDTO, events: [EventDTO]) {
            self.competition = competition
            self.events = events
        }
    }

}
