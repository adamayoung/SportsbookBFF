import Foundation
import NIO

public protocol CompetitionService {

    func fetchCompetition(withID id: CompetitionDomainModel.ID) -> EventLoopFuture<CompetitionDomainModel?>

    func fetchCompetitions(
        forEventType eventTypeID: EventTypeDomainModel.ID) -> EventLoopFuture<[CompetitionDomainModel]>

}
