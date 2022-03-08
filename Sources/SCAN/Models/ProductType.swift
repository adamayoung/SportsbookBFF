import Foundation

public enum ProductType: String, CaseIterable, Equatable, Hashable, Codable {

    case sportsbook = "SPORTSBOOK"
    case exchange = "EXCHANGE"
    case tote = "TOTE"

    public static let `default`: ProductType = .sportsbook

}

extension Collection where Element == ProductType {

    public static var `default`: [ProductType] {
        [.default]
    }

}
