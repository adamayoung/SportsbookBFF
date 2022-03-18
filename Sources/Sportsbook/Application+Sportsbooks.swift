import Vapor

extension Application {

    public var sportbooks: Sportsbooks {
        .init(application: self)
    }

    public struct Sportsbooks {
        public struct Provider {
            let run: (Application) -> Void

            public init(_ run: @escaping (Application) -> Void) {
                self.run = run
            }
        }

        let application: Application

        public func use(_ provider: Provider) {
            provider.run(application)
        }
    }

}
