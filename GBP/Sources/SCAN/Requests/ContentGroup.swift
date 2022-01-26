import Foundation

public struct ContentGroup: Equatable, Hashable, Codable {

    public let language: String
    public let regionCode: String

    public init(language: String, regionCode: String) {
        self.language = language
        self.regionCode = regionCode
    }

}

extension ContentGroup {

    public static var `default`: ContentGroup {
        .init(language: "en", regionCode: "UK")
    }

}
