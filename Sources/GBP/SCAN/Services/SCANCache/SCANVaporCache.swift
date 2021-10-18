import Vapor

final class SCANVaporCache: SCANCache {

    private static let defaultExpirationTime: CacheExpirationTime = .seconds(10)

    private let cache: Cache
    private let eventLoop: EventLoop
    private let logger: Logger

    init(cache: Cache, eventLoop: EventLoop, logger: Logger) {
        self.cache = cache
        self.eventLoop = eventLoop
        self.logger = logger
    }

    func get(responseForRequest searchRequest: SearchRequest) -> EventLoopFuture<SearchResponse?> {
        cache.get(searchRequest)
            .always { result in
                let metadata: Logger.Metadata = [
                    "search-request-hash": .stringConvertible(searchRequest.hashValue)
                ]

                switch result {
                case .success(let response):
                    if response == nil {
                        self.logger.debug("SCAN Cache: MISS", metadata: metadata)
                    } else {
                        self.logger.debug("SCAN Cache: HIT", metadata: metadata)
                    }

                case .failure(let error):
                    self.logger.debug("SCAN Cache: ERROR", metadata: metadata)
                    self.logger.report(error: error)
                }
            }
    }

    func set(request searchRequest: SearchRequest,
             to searchResponse: SearchResponse) -> EventLoopFuture<Void> {
        cache.set(searchRequest, to: searchResponse, expiresIn: Self.defaultExpirationTime)
            .always { result in
                let metadata: Logger.Metadata = [
                    "search-request-hash": .stringConvertible(searchRequest.hashValue)
                ]

                switch result {
                case .success:
                    self.logger.debug("SCAN Cache: SET", metadata: metadata)

                case .failure(let error):
                    self.logger.debug("SCAN Cache: ERROR", metadata: metadata)
                    self.logger.report(error: error)
                }
            }
    }

}

private extension Cache {

    func get(_ searchRequest: SearchRequest) -> EventLoopFuture<SearchResponse?> {
        let key = Self.cacheKey(for: searchRequest)
        return get(key)
    }

    func set(_ searchRequest: SearchRequest, to searchResponse: SearchResponse,
             expiresIn: CacheExpirationTime) -> EventLoopFuture<Void> {
        let key = Self.cacheKey(for: searchRequest)
        return set(key, to: searchResponse, expiresIn: expiresIn)
    }

    private static func cacheKey(for searchRequest: SearchRequest) -> String {
        "SearchRequest-\(searchRequest.hashValue)"
    }

}
