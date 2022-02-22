import Foundation

public struct RunnerAttachment: Equatable, Codable {

    public let selectionId: SelectionID
    public let handicap: Handicap
    public let key: String?
    public let runnerName: String
    public let sortPriority: Int
    public let runnerStatus: RunnerAttachment.Status
    public let result: RunnerAttachment.RunnerResult?

    public init(selectionId: Int, handicap: Double, key: String? = nil, runnerName: String, sortPriority: Int,
                runnerStatus: RunnerAttachment.Status, result: RunnerAttachment.RunnerResult) {
        self.selectionId = selectionId
        self.handicap = handicap
        self.key = key
        self.runnerName = runnerName
        self.sortPriority = sortPriority
        self.runnerStatus = runnerStatus
        self.result = result
    }

}

extension RunnerAttachment {

    public enum Status: String, Equatable, CaseIterable, Codable {

        case active = "ACTIVE"
        case winner = "WINNER"
        case loser = "LOSER"
        case removeVacant = "REMOVE_VACANT"
        case removed = "REMOVED"
        case unknown = "UNKNOWN"

        public init(from decoder: Decoder) throws {
            self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }

    }

    public struct RunnerResult: Equatable, Codable {

        public let type: RunnerResultType?
        public let scoreHome: Int?
        public let scoreAway: Int?

        public init(type: RunnerResultType? = nil, scoreHome: Int? = nil, scoreAway: Int? = nil) {
            self.type = type
            self.scoreHome = scoreHome
            self.scoreAway = scoreAway
        }

    }

}

extension RunnerAttachment.RunnerResult {

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
