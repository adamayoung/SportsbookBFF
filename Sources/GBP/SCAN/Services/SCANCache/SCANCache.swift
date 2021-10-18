import Foundation
import NIO

protocol SCANCache {

    func get(responseForRequest searchRequest: SearchRequest) -> EventLoopFuture<SearchResponse?>

    func set(request searchRequest: SearchRequest, to searchResponse: SearchResponse) -> EventLoopFuture<Void>

}
