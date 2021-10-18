import Foundation
import NIO
import Sportsbook

struct MockEventTypeService: EventTypeService {

    let eventTypes: [EventType]
    private let eventLoop: EventLoop

    init(eventTypes: [EventType], eventLoop: EventLoop) {
        self.eventTypes = eventTypes
        self.eventLoop = eventLoop
    }

    func fetchEventType(withID id: EventType.ID) -> EventLoopFuture<EventType?> {
        let result = eventTypes.first { $0.id == id }
        return eventLoop.makeSucceededFuture(result)
    }

    func fetchEventTypes() -> EventLoopFuture<[EventType]> {
        return eventLoop.makeSucceededFuture(eventTypes)
    }

}
