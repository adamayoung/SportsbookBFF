import Foundation

struct Runner: Equatable, Codable {

    let selectionID: Int
    let name: String
    let handicap: Double
    let sortPriority: Int
    let status: RunnerStatus
    let result: RunnerResult?

    init(selectionID: Int, name: String, handicap: Double, sortPriority: Int, status: RunnerStatus,
         result: RunnerResult? = nil) {
        self.selectionID = selectionID
        self.name = name
        self.handicap = handicap
        self.sortPriority = sortPriority
        self.status = status
        self.result = result
    }

}

extension Runner {

    enum RunnerStatus: String, CaseIterable, Equatable, Codable {

        case active = "ACTIVE"
        case suspended = "SUSPENDED"
        case removed = "REMOVED"
        case unknown = "UNKNOWN"

    }

    struct RunnerResult: Equatable, Codable {

        let type: RunnerResultType?

        init(type: Runner.RunnerResult.RunnerResultType? = nil) {
            self.type = type
        }

    }

}

extension Runner.RunnerResult {

    public enum RunnerResultType: String, CaseIterable, Equatable, Codable {

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
