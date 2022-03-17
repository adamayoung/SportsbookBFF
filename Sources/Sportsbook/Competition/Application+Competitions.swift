import Vapor

extension Application {

    public var competitionProviders: CompetitionProviders {
        .init(application: self)
    }

    public struct CompetitionProviders {
        final class Storage {
            var make: ((Request) -> CompetitionProvider)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        public func use(_ make: @escaping (Request) -> (CompetitionProvider)) {
            if self.application.storage[Key.self] == nil {
                self.application.storage[Key.self] = .init()
            }

            self.application.storage[Key.self]?.make = make
        }

        func make(_ request: Request) -> CompetitionProvider {
            guard let make = request.application.storage[Key.self]?.make else {
                fatalError("CompetitionProviders not configured. Configure with app.competitionProviders.use(...)")
            }

            return make(request)
        }
    }

}

extension Request {

    public var competitions: CompetitionProvider {
        application.competitionProviders.make(self)
    }

}
