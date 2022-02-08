import Foundation
import SportsbookCore

struct MockEventTypeService: EventTypeService {

    let eventTypes: [EventTypeDomainModel]

    init(eventTypes: [EventTypeDomainModel] = EventTypeDomainModel.mocks) {
        self.eventTypes = eventTypes
    }

    func eventType(withID id: EventTypeDomainModel.ID) async throws -> EventTypeDomainModel? {
        eventTypes.first { $0.id == id }
    }

    func eventTypes(filter: EventTypesFilterConvertible?) async throws -> [EventTypeDomainModel] {
        eventTypes
    }

}
