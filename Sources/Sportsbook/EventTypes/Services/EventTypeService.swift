import Foundation
import NIO

public protocol EventTypeService {

    func fetchEventType(withID id: EventTypeDomainModel.ID) -> EventLoopFuture<EventTypeDomainModel?>

    func fetchEventTypes(filter: EventTypesFilterConvertible?) -> EventLoopFuture<[EventTypeDomainModel]>

}

public extension EventTypeService {

    func fetchEventTypes() -> EventLoopFuture<[EventTypeDomainModel]> {
        fetchEventTypes(filter: nil)
    }

}
