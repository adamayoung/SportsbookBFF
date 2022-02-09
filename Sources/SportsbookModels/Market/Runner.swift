import Vapor

public struct Runner: Equatable, Content {

    public let selectionID: Int
    public let name: String
    public let handicap: Double
    public let sortPriority: Int
    public let status: RunnerStatus
    public let result: RunnerResult?

    public init(selectionID: Int, name: String, handicap: Double, sortPriority: Int, status: RunnerStatus,
                result: RunnerResult? = nil) {
        self.selectionID = selectionID
        self.name = name
        self.handicap = handicap
        self.sortPriority = sortPriority
        self.status = status
        self.result = result
    }

}

public extension Runner {

    enum RunnerStatus: String, CaseIterable, Equatable, Codable {

        case active = "ACTIVE"
        case suspended = "SUSPENDED"
        case removed = "REMOVED"
        case unknown = "UNKNOWN"

    }

    struct RunnerResult: Equatable, Codable {

        public let type: RunnerResultType?

        public init(type: Runner.RunnerResult.RunnerResultType? = nil) {
            self.type = type
        }

    }

}

public extension Runner.RunnerResult {

    enum RunnerResultType: String, CaseIterable, Equatable, Codable {

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
