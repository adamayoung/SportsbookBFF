import Foundation

struct RunnerModel: Equatable, Codable {

    let selectionID: Int
    let name: String
    let handicap: Double
    let sortPriority: Int
    let status: RunnerStatus
    let result: RunnerResult?

}

extension RunnerModel {

    enum RunnerStatus: String, Equatable, Codable {

        case active = "ACTIVE"
        case suspended = "SUSPENDED"
        case removed = "REMOVED"
        case unknown = "UNKNOWN"

    }

    struct RunnerResult: Equatable, Codable {

        let type: RunnerResultType?

    }

}

extension RunnerModel.RunnerResult {

    public enum RunnerResultType: String, Equatable, Codable {

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
