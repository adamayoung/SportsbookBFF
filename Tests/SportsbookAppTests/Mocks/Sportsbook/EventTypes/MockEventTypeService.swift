import Foundation
import NIO
import Sportsbook

struct MockEventTypeService: EventTypeService {

    let eventTypes: [EventTypeDomainModel]
    private let eventLoop: EventLoop

    init(eventTypes: [EventTypeDomainModel] = EventTypeDomainModel.mocks, eventLoop: EventLoop) {
        self.eventTypes = eventTypes
        self.eventLoop = eventLoop
    }

    func fetchEventType(withID id: EventTypeDomainModel.ID) -> EventLoopFuture<EventTypeDomainModel?> {
        let result = eventTypes.first { $0.id == id }
        return eventLoop.makeSucceededFuture(result)
    }

    func fetchEventTypes(filter: EventTypesFilterConvertible?) -> EventLoopFuture<[EventTypeDomainModel]> {
        eventLoop.makeSucceededFuture(eventTypes)
    }

}
