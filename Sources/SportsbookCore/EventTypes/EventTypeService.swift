import Foundation

public protocol EventTypeService {

    func eventType(withID id: EventTypeDomainModel.ID) async throws -> EventTypeDomainModel?

    func eventTypes(filter: EventTypesFilterConvertible?) async throws -> [EventTypeDomainModel]

}

extension EventTypeService {

    public func fetchEventTypes() async throws -> [EventTypeDomainModel] {
        try await eventTypes(filter: nil)
    }

}
