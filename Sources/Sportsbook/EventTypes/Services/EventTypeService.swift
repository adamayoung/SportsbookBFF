import Foundation
import NIO

public protocol EventTypeService {

    func fetchEventType(withID id: EventType.ID) -> EventLoopFuture<EventType?>

    func fetchEventTypes() -> EventLoopFuture<[EventType]>

}
