import GBPCore
import Vapor

extension Application {

    public var smpServices: SMPServices {
        .init(application: self)
    }

    public struct SMPServices {
        public struct Provider {
            let run: (Request) -> (SMPService)

            public init(_ run: @escaping (Request) -> (SMPService)) {
                self.run = run
            }
        }

        final class Storage {
            var make: ((Request) -> SMPService)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        public func use(_ provider: Provider) {
            self.use { provider.run($0) }
        }

        public func use(_ make: @escaping (Request) -> (SMPService)) {
            if self.application.storage[Key.self] == nil {
                self.application.storage[Key.self] = .init()
            }

            self.application.storage[Key.self]?.make = make
        }

        func make(_ request: Request) -> SMPService {
            guard let make = request.application.storage[Key.self]?.make else {
                fatalError("SMPServices not configured. Configure with app.smpServices.use(...)")
            }

            return make(request)
        }
    }

}
