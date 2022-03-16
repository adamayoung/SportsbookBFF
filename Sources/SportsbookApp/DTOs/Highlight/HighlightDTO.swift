import Foundation

struct HighlightDTO: Equatable, Codable {

    let sport: SportDTO
    let events: [EventDTO]
    let markets: [EventDTO.ID: [MarketDTO]]

}
