import Vapor

struct CompetitionProviderFactory {

    var make: ((Request) -> CompetitionProvider)?

    mutating func use(_ make: @escaping ((Request) -> CompetitionProvider)) {
        self.make = make
    }

}

extension Application {

    private struct CompetitionProviderKey: StorageKey {
        typealias Value = CompetitionProviderFactory
    }

    var competitionsFactory: CompetitionProviderFactory {
        get {
            self.storage[CompetitionProviderKey.self] ?? .init()
        }
        set {
            self.storage[CompetitionProviderKey.self] = newValue
        }
    }

}
