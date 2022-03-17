import GBPCore
import Logging
import Vapor

struct SMPService: SMPProvider {

    private static let marketPricesPath = "/www/sports/fixedodds/readonly/v1/getMarketPrices?priceHistory=1"

    private let application: Application
    private var logger: Logger { application.logger }
    private var gbpClient: GBPClientProvider { application.gbpClient }

    init(application: Application) {
        self.application = application
    }

    func marketPrices(forMarkets marketIDs: [String], maxResults: Int?) async throws -> [MarketDetails] {
        guard let configuration = self.configuration else {
            fatalError("SMP not configured. Use app.smp.configuration = ...")
        }

        logger.debug("Fetching market prices from SMP service",
                     metadata: ["marketIDs": .stringConvertible(marketIDs.joined(separator: ", "))])

        let body = MarketPricesRequest(marketIds: marketIDs, priceHistory: maxResults)
        return try await gbpClient.post(Self.marketPricesPath, body: body, configuration: configuration)
    }

}

extension SMPService {

    struct ConfigurationKey: StorageKey {
        typealias Value = SMPConfiguration
    }

    public var configuration: SMPConfiguration? {
        get {
            application.storage[ConfigurationKey.self]
        }

        nonmutating set {
            application.storage[ConfigurationKey.self] = newValue
        }
    }

}

extension Application {

    public var smp: SMPProvider {
        SMPService(application: self)
    }

}

extension Request {

    public var smp: SMPProvider {
        SMPService(application: application)
    }

}
