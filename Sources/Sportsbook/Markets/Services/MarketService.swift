import Foundation
import NIO

public protocol MarketService {

    func fetchMarket(withID id: Market.ID) -> EventLoopFuture<Market?>

    func fetchMarkets(forEvent eventID: Int) -> EventLoopFuture<[Market]>

}
