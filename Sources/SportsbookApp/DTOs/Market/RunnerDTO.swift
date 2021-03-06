import Foundation

struct RunnerDTO: Identifiable, Equatable, Codable {

    var id: Int { selectionID }
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

extension RunnerDTO {

    enum RunnerStatus: String, CaseIterable, Equatable, Codable {
        case active
        case winner
        case loser
        case removeVacant
        case removed
    }

    struct RunnerResult: Equatable, Codable {

        let type: RunnerResultType?

        init(type: RunnerDTO.RunnerResult.RunnerResultType? = nil) {
            self.type = type
        }

    }

}

extension RunnerDTO.RunnerResult {

    enum RunnerResultType: String, CaseIterable, Equatable, Codable {
        case home
        case away
        case draw
        case over
        case under
        case line
        case score
        case noGoal
    }

}
