import Foundation

public struct Tag: CustomStringConvertible, RawRepresentable, Equatable {

    public let rawValue: String

    public var description: String {
        rawValue
    }

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

}
