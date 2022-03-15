import Vapor

struct SportProviderFactory {

    var make: ((Request) -> SportProvider)?

    mutating func use(_ make: @escaping ((Request) -> SportProvider)) {
        self.make = make
    }

}

extension Application {

    private struct SportProviderFactoryKey: StorageKey {
        typealias Value = SportProviderFactory
    }

    var sportsFactory: SportProviderFactory {
        get {
            self.storage[SportProviderFactoryKey.self] ?? .init()
        }
        set {
            self.storage[SportProviderFactoryKey.self] = newValue
        }
    }

}
