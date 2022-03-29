import Foundation
import Sportsbook

extension HomeDTO {

    init(sports: [Sport], popular: [Sport]) {
        let popularSportIDs = popular.map(\.id)
        let sports = Set(sports).union(popular).map(SportDTO.init)

        self.init(sports: sports, popularSportIDs: popularSportIDs)
    }

}
