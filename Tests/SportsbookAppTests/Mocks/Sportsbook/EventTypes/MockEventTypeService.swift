import Foundation
import SportsbookCore

struct MockEventTypeService: EventTypeService {

    let eventTypes: [EventTypeDomainModel]

    init(eventTypes: [EventTypeDomainModel] = EventTypeDomainModel.mocks) {
        self.eventTypes = eventTypes
    }

    func fetchEventType(withID id: EventTypeDomainModel.ID) async throws -> EventTypeDomainModel? {
        eventTypes.first { $0.id == id }
    }

    func fetchEventTypes(filter: EventTypesFilterConvertible?) async throws -> [EventTypeDomainModel] {
        eventTypes
    }

}
