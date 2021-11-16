import Foundation

public enum MarketLevel: String, CaseIterable, Equatable, Hashable, Codable {

    case avbEvent = "AVB_EVENT"
    case competition = "COMPETITION"
    case subAVBEvent = "SUB_AVB_EVENT"
    case subCompetition = "SUB_COMPETITION"

}
