import Foundation

struct HomeDTO: Equatable, Codable {

    let sports: [SportDTO]
    let popularSportIDs: [SportDTO.ID]

    init(sports: [SportDTO], popularSportIDs: [SportDTO.ID]) {
        self.sports = sports
        self.popularSportIDs = popularSportIDs
    }

}
