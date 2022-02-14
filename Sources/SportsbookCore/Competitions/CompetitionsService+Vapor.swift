import Vapor

extension Application {

    private struct CompetitionServiceKey: StorageKey {
        typealias Value = CompetitionServiceFactory
    }

    public var competitionService: CompetitionServiceFactory {
        get {
            self.storage[CompetitionServiceKey.self] ?? .init()
        }
        set {
            self.storage[CompetitionServiceKey.self] = newValue
        }
    }

}

extension Request {

    public var competitionService: CompetitionService {
        self.application.competitionService.make!(self)
    }

}
