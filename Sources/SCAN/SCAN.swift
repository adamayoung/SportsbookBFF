import GBPCore
import Logging
import Vapor

struct SCAN: SCANProvider {

    private static let searchPath = "/www/sports/navigation/facet/v1.0/search"

    private let application: Application
    private var logger: Logger { application.logger }
    private var gbpClient: GBPClientProvider { application.gbpClient }

    init(application: Application) {
        self.application = application
    }

    func search(_ searchRequest: SearchRequest) async throws -> FacetedSearchResult {
        guard let configuration = self.configuration else {
            fatalError("SCAN not configured. Use app.scan.configuration = ...")
        }

        logger.debug("Searching SCAN service", metadata: ["facets": .stringConvertible(searchRequest.facets)])
        return try await gbpClient.post(Self.searchPath, body: searchRequest, configuration: configuration)
    }

}

extension SCAN {

    struct ConfigurationKey: StorageKey {
        typealias Value = SCANConfiguration
    }

    public var configuration: SCANConfiguration? {
        get {
            application.storage[ConfigurationKey.self]
        }

        nonmutating set {
            application.storage[ConfigurationKey.self] = newValue
        }
    }

}

extension Application {

    public var scan: SCANProvider {
        SCAN(application: self)
    }

}

extension Request {

    public var scan: SCANProvider {
        SCAN(application: application)
    }

}
