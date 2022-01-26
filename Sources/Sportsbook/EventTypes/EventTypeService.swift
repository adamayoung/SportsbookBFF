import Foundation

public protocol EventTypeService {

    func fetchEventType(withID id: EventTypeDomainModel.ID) async throws -> EventTypeDomainModel?

    func fetchEventTypes(filter: EventTypesFilterConvertible?) async throws -> [EventTypeDomainModel]

}

public extension EventTypeService {

    func fetchEventTypes() async throws -> [EventTypeDomainModel] {
        try await fetchEventTypes(filter: nil)
    }

}
