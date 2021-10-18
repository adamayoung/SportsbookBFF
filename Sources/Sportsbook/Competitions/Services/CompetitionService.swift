import Foundation
import NIO

public protocol CompetitionService {

    func fetchCompetition(withID id: Competition.ID) -> EventLoopFuture<Competition?>

    func fetchCompetitions(forEventType eventTypeID: EventType.ID) -> EventLoopFuture<[Competition]>

}
