import Vapor

struct NodeHTTPService: NodeService {

    private let configuration: CMSConfiguration
    private let client: Client
    private let eventLoop: EventLoop
    private let logger: Logger

    init(configuration: CMSConfiguration, client: Client, eventLoop: EventLoop, logger: Logger) {
        self.configuration = configuration
        self.client = client.logging(to: logger)
        self.eventLoop = eventLoop
        self.logger = logger
    }

    func fetchNodes(withTag tag: Tag, liveAtDate: Date = Date()) -> EventLoopFuture<[CMSNode]> {
        logger.debug("Fetching nodes from CMS service",
                     metadata: [
                        "tag": .stringConvertible(tag),
                        "liveAtDate": .stringConvertible(liveAtDate)
                     ]
        )

        let endpoint = Endpoint.nodes(tag: tag, liveAtDate: liveAtDate)
        let uri = endpoint.uri(with: configuration)
        var headers = HTTPHeaders()
        headers.add(name: .accept, value: "application/json")
        headers.add(name: .userAgent, value: "SportsbookBFF/1.0")

        return client.get(uri, headers: headers)
            .flatMapThrowing { response in
                guard response.status == .ok else {
                    throw Abort(response.status)
                }

                return try response.content.decode([CMSNode].self, using: JSONDecoder.cms)
            }
            .always { result in
                switch result {
                case .failure(let error):
                    logger.debug("Fetching nodes from CMS service failed",
                                 metadata: [
                                    "tag": .stringConvertible(tag),
                                    "liveAtDate": .stringConvertible(liveAtDate)
                                 ]
                    )

                    self.logger.report(error: error)

                default:
                    break
                }
            }
    }

}
