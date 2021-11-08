import Foundation

public struct RunnerDomainModel: Identifiable, Equatable, Hashable, Codable {

    public var id: Int { selectionID }
    public let selectionID: Int
    public let name: String
    public let handicap: Double
    public let sortPriority: Int
    public let status: RunnerStatus
    public let result: RunnerResult

    public init(selectionID: Int, name: String, handicap: Double, sortPriority: Int, status: RunnerStatus,
                result: RunnerResult) {
        self.selectionID = selectionID
        self.handicap = handicap
        self.name = name
        self.sortPriority = sortPriority
        self.status = status
        self.result = result
    }

}

extension RunnerDomainModel {

    public enum RunnerStatus: String, Equatable, Hashable, CaseIterable, Codable {

        case active = "ACTIVE"
        case suspended = "SUSPENDED"
        case removed = "REMOVED"
        case unknown = "UNKNOWN"

    }

    public struct RunnerResult: Equatable, Hashable, Codable {

        public let type: RunnerResultType?

        public init(type: RunnerResultType? = nil) {
            self.type = type
        }

    }

}

extension RunnerDomainModel.RunnerResult {

    public enum RunnerResultType: String, Equatable, Hashable, CaseIterable, Codable {

        case home = "HOME"
        case away = "AWAY"
        case draw = "DRAW"
        case over = "OVER"
        case under = "UNDER"
        case line = "LINE"
        case score = "SCORE"
        case noGoal = "NO_GOAL"

    }

}
