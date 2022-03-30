import Foundation
import Sportsbook

extension SportHomeDTO {

    init(sport: Sport, events: [Event], competitions: [Competition]) {
        let sportDTO = SportDTO(sport: sport)
        let competitionDTOs = competitions.map(CompetitionDTO.init)

        let inPlayEvents = events.map(EventDTO.init)
        var competitionEvents = [CompetitionDTO: [EventDTO]]()
        for event in inPlayEvents {
            guard let competition = competitionDTOs.first(where: { $0.id == event.competitionID }) else {
                continue
            }

            var events = competitionEvents[competition, default: [EventDTO]()]
            events.append(event)
            competitionEvents[competition] = events
        }

        let competitionEventsDTOs = competitionEvents.keys.map { competition in
            CompetitionEventsDTO(competition: competition, events: competitionEvents[competition, default: []])
        }

        self.init(sport: sportDTO, inPlay: competitionEventsDTOs, competitions: competitionDTOs)
    }

}
