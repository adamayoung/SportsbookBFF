import Vapor

extension Application {

    public var competitionServices: CompetitionServices {
        .init(application: self)
    }

    public struct CompetitionServices {
        final class Storage {
            var make: ((Request) -> CompetitionService)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        public func use(_ make: @escaping (Request) -> (CompetitionService)) {
            if self.application.storage[Key.self] == nil {
                self.application.storage[Key.self] = .init()
            }

            self.application.storage[Key.self]?.make = make
        }

        func make(_ request: Request) -> CompetitionService {
            guard let make = request.application.storage[Key.self]?.make else {
                fatalError("CompetitionServices not configured. Configure with app.competitionServices.use(...)")
            }

            return make(request)
        }
    }

}

extension Request {

    public var competitions: CompetitionService {
        application.competitionServices.make(self)
    }

}
