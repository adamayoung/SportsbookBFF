import Vapor

public extension Environment {

    struct Key: CustomStringConvertible, Equatable {

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

    static func get(_ key: Key) -> String? {
        self.get(key.description)
    }

}
