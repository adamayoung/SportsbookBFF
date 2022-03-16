import Vapor

extension Application {

    public var sportsCMSProviders: SportsCMSProviders {
        .init(application: self)
    }

    public struct SportsCMSProviders {
        public struct Provider {
            let run: (Request) -> (SportsCMSProvider)

            public init(_ run: @escaping (Request) -> (SportsCMSProvider)) {
                self.run = run
            }
        }

        final class Storage {
            var make: ((Request) -> SportsCMSProvider)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        public func use(_ configuration: CMSConfiguration) {
            if self.application.storage[Key.self] == nil {
                self.application.storage[Key.self] = .init()
            }

            self.use {
                SportsCMS(configuration: configuration, client: $0.cmsClient, logger: $0.logger)
            }
        }

        public func use(_ provider: Provider) {
            self.use { provider.run($0) }
        }

        public func use(_ make: @escaping (Request) -> (SportsCMSProvider)) {
            if self.application.storage[Key.self] == nil {
                self.application.storage[Key.self] = .init()
            }

            self.application.storage[Key.self]?.make = make
        }

        func make(_ request: Request) -> SportsCMSProvider {
            guard let make = request.application.storage[Key.self]?.make else {
                fatalError("SportsCMSProviders not configured. Configure with app.sportsCMSProviders.use(...)")
            }

            return make(request)
        }
    }

}

extension Application.SportsCMSProviders.Provider {

    public static func isp(baseURL: String, apiKey: String) -> Self {
        let configuration = CMSConfiguration.init(baseURL: baseURL, apiKey: apiKey)
        return isp(configuration)
    }

    public static func isp(_ configuration: CMSConfiguration) -> Self {
        .init {
            SportsCMS(configuration: configuration, client: $0.cmsClient, logger: $0.logger)
        }
    }

}
