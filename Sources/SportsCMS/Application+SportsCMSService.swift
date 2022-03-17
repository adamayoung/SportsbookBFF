import Vapor

extension Application {

    public var sportsCMSServices: SportsCMSServices {
        .init(application: self)
    }

    public struct SportsCMSServices {
        public struct Provider {
            let run: (Request) -> (SportsCMSService)

            public init(_ run: @escaping (Request) -> (SportsCMSService)) {
                self.run = run
            }
        }

        final class Storage {
            var make: ((Request) -> SportsCMSService)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        func use(_ configuration: CMSConfiguration) {
            if self.application.storage[Key.self] == nil {
                self.application.storage[Key.self] = .init()
            }

            self.use {
                ISPSportsCMSService(configuration: configuration, client: $0.cmsClient, logger: $0.logger)
            }
        }

        public func use(_ provider: Provider) {
            self.use { provider.run($0) }
        }

        public func use(_ make: @escaping (Request) -> (SportsCMSService)) {
            if self.application.storage[Key.self] == nil {
                self.application.storage[Key.self] = .init()
            }

            self.application.storage[Key.self]?.make = make
        }

        func make(_ request: Request) -> SportsCMSService {
            guard let make = request.application.storage[Key.self]?.make else {
                fatalError("SportsCMSServices not configured. Configure with app.sportsCMSServices.use(...)")
            }

            return make(request)
        }
    }

}
