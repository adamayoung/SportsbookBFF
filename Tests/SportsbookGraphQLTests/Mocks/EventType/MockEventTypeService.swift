import Foundation
import NIO
import Sportsbook

final class MockEventTypeService: EventTypeService {

    private let eventLoop: EventLoop

    init(eventLoop: EventLoop) {
        self.eventLoop = eventLoop
    }

    func fetchEventType(withID id: EventType.ID) -> EventLoopFuture<EventType?> {
        let eventType = EventType.mocks.first { $0.id == id }
        return eventLoop.makeSucceededFuture(eventType)
    }

    func fetchEventTypes() -> EventLoopFuture<[EventType]> {
        eventLoop.makeSucceededFuture(EventType.mocks)
    }

}
