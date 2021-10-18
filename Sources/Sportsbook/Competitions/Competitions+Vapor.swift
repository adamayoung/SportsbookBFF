import GBP
import Vapor

public extension Application {

    private struct CompetitionServiceKey: StorageKey {
        typealias Value = CompetitionServiceFactory
    }

    var competitionService: CompetitionServiceFactory {
        get {
            self.storage[CompetitionServiceKey.self] ?? .init()
        }
        set {
            self.storage[CompetitionServiceKey.self] = newValue
        }
    }

}

public extension Request {

    var competitionService: CompetitionService {
        self.application.competitionService.make!(self)
    }

}
