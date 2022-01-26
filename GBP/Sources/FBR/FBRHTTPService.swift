import GBPCore
import Vapor

struct FBRHTTPService: FBRService {

    private let configuration: TLAConfiguration
    private let client: Client
    private let logger: Logger

    init(configuration: TLAConfiguration, client: Client, logger: Logger) {
        self.configuration = configuration
        self.client = client.logging(to: logger)
        self.logger = logger
    }

    func search() async throws {
        logger.debug("Searching FBR service")
    }

}
