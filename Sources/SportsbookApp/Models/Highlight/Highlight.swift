import Foundation

struct Highlight: Equatable, Codable {

    let sport: Sport
    let events: [Event]
    let markets: [Event.ID: [Market]]

}
