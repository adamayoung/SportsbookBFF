import Vapor

public struct CompetitionServiceFactory {

    public var make: ((Request) -> CompetitionService)?

    public mutating func use(_ make: @escaping ((Request) -> CompetitionService)) {
        self.make = make
    }

}
