import Foundation

public struct Runner: Codable {

    public let selectionId: Int
    public let handicap: Double
    public let runnerName: String
    public let sortPriority: Int
    public let runnerStatus: RunnerStatus
    public let result: RunnerResult

    public init(selectionId: Int, handicap: Double, runnerName: String, sortPriority: Int,
                runnerStatus: Runner.RunnerStatus, result: Runner.RunnerResult) {
        self.selectionId = selectionId
        self.handicap = handicap
        self.runnerName = runnerName
        self.sortPriority = sortPriority
        self.runnerStatus = runnerStatus
        self.result = result
    }

}

extension Runner {

    public enum RunnerStatus: String, Equatable, CaseIterable, Codable {

        case active = "ACTIVE"
        case suspended = "SUSPENDED"
        case removed = "REMOVED"
        case unknown = "UNKNOWN"

        public init(from decoder: Decoder) throws {
            self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }

    }

    public struct RunnerResult: Equatable, Codable {

        public let type: RunnerResultType?

        public init(type: RunnerResultType? = nil) {
            self.type = type
        }

    }

}

extension Runner.RunnerResult {

    public enum RunnerResultType: String, Equatable, CaseIterable, Codable {

        case home = "HOME"
        case away = "AWAY"
        case draw = "DRAW"
        case over = "OVER"
        case under = "UNDER"
        case line = "LINE"
        case score = "SCORE"
        case noGoal = "NO_GOAL"
        case unknown = "UNKNOWN"

        public init(from decoder: Decoder) throws {
            self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }

    }

}
