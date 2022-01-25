import Foundation

public struct LegCombination: Codable {

    public let legType: LegType
    public let runners: [LegCombinationRunner]

    public init(legType: LegType, runners: [LegCombinationRunner]) {
        self.legType = legType
        self.runners = runners
    }

}
