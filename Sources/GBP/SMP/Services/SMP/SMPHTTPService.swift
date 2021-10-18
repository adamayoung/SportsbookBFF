import Vapor

struct SMPHTTPService: SMPService {

    private let configuration: TLAConfiguration
    private let client: Client
    private let eventLoop: EventLoop
    private let logger: Logger

    init(configuration: TLAConfiguration, client: Client, eventLoop: EventLoop, logger: Logger) {
        self.configuration = configuration
        self.client = client.logging(to: logger)
        self.eventLoop = eventLoop
        self.logger = logger
    }

    func search() -> EventLoopFuture<Void> {
        logger.debug("Searching SMP service")

        return eventLoop.makeSucceededVoidFuture()
    }

}
