import Vapor

struct EventTypesQuery: Content {

    let id: EventType.ID?
    let category: EventType.Category?

    init(id: EventType.ID? = nil, category: EventType.Category? = nil) {
        self.id = id
        self.category = category
    }

}
