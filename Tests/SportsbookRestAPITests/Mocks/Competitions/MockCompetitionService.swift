import Foundation
import NIO
import Sportsbook

struct MockCompetitionService: CompetitionService {

    let competitions: [Competition]
    private let eventLoop: EventLoop

    init(competitions: [Competition], eventLoop: EventLoop) {
        self.competitions = competitions
        self.eventLoop = eventLoop
    }

    func fetchCompetition(withID id: Competition.ID) -> EventLoopFuture<Competition?> {
        let result = competitions.first { $0.id == id }
        return eventLoop.makeSucceededFuture(result)
    }

    func fetchCompetitions(forEventType eventTypeID: Int) -> EventLoopFuture<[Competition]> {
        let result = competitions.filter { $0.eventTypeID == eventTypeID }
        return eventLoop.makeSucceededFuture(result)
    }

}
