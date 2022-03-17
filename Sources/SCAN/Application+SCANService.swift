import GBPCore
import Vapor

extension Application {

    public var scanServices: SCANServices {
        .init(application: self)
    }

    public struct SCANServices {
        public struct Provider {
            let run: (Request) -> (SCANService)

            public init(_ run: @escaping (Request) -> (SCANService)) {
                self.run = run
            }
        }

        final class Storage {
            var make: ((Request) -> SCANService)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        public func use(_ provider: Provider) {
            self.use { provider.run($0) }
        }

        public func use(_ make: @escaping (Request) -> (SCANService)) {
            if self.application.storage[Key.self] == nil {
                self.application.storage[Key.self] = .init()
            }

            self.application.storage[Key.self]?.make = make
        }

        func make(_ request: Request) -> SCANService {
            guard let make = request.application.storage[Key.self]?.make else {
                fatalError("SCANServices not configured. Configure with app.scanServices.use(...)")
            }

            return make(request)
        }
    }

}
