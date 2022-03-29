import Foundation

public struct MarketType: Hashable, Equatable, CustomStringConvertible {

    let name: String

    public init(_ name: String) {
        self.name = name
    }

    public init(stringLiteral: String) {
        self.init(stringLiteral)
    }

    public var description: String {
        self.name
    }

    public func hash(into hasher: inout Hasher) {
        self.name.hash(into: &hasher)
    }

}
