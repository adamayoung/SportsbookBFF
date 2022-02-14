import Foundation

public struct Tag: CustomStringConvertible, Equatable {

    private let name: String

    public init(_ name: String) {
        self.name = name
    }

    public init(stringLiteral: String) {
        self.init(stringLiteral)
    }

    public var description: String {
        return name
    }

}
