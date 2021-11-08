import Vapor

extension EventsController {

    struct EventsFromEventTypeQuery: Content {

        let isInPlay: Bool?

        init(isInPlay: Bool? = nil) {
            self.isInPlay = isInPlay
        }

    }

}
