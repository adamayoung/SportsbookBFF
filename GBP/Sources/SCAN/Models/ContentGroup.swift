import Foundation

public struct ContentGroup: Equatable, Hashable, Codable {

    public let regionCode: String?
    public let language: String

    public init(regionCode: String? = nil, language: String) {
        self.regionCode = regionCode
        self.language = language
    }

}

extension ContentGroup {

    public static var `default`: ContentGroup {
        .init(regionCode: "UK", language: "en")
    }

}
