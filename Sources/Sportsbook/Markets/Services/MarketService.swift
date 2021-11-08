import Foundation
import NIO

public protocol MarketService {

    func fetchMarket(withID id: MarketDomainModel.ID) -> EventLoopFuture<MarketDomainModel?>

    func fetchMarkets(forEvent eventID: Int) -> EventLoopFuture<[MarketDomainModel]>

}
