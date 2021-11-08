import Foundation
import NIO
import Sportsbook

struct MockCompetitionService: CompetitionService {

    let competitions: [CompetitionDomainModel]
    private let eventLoop: EventLoop

    init(competitions: [CompetitionDomainModel], eventLoop: EventLoop) {
        self.competitions = competitions
        self.eventLoop = eventLoop
    }

    func fetchCompetition(withID id: CompetitionDomainModel.ID) -> EventLoopFuture<CompetitionDomainModel?> {
        let result = competitions.first { $0.id == id }
        return eventLoop.makeSucceededFuture(result)
    }

    func fetchCompetitions(forEventType eventTypeID: Int) -> EventLoopFuture<[CompetitionDomainModel]> {
        let result = competitions.filter { $0.eventTypeID == eventTypeID }
        return eventLoop.makeSucceededFuture(result)
    }

}
