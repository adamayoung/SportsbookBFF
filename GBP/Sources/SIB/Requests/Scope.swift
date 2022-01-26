import Foundation

public enum Scope: String, CaseIterable, Codable {

    /// Build all valid single bets.
    case singles = "SINGLES"
    /// Build only multiples including all valid bet legs.
    case multiples = "MULTIPLES"
    /// Build all bet combinations including all valid bet legs.
    case all = "ALL"
    /// Build teaser bets only.
    case teaser = "TEASER"

}
