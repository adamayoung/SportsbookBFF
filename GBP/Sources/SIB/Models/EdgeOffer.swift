import Foundation

public struct EdgeOffer: Codable {

    public let edge: Edge
    public let eachwayPlaces: Int?
    public let offset: Int?
    public let edgePrice: Odds?
    public let edgeEachwayAvgPrice: Odds?
    public let tokenId: String?
    public let generosity: Double?
    public let edgeMaxStake: Double?
    public let edgeMaxStakeEachway: Double?

    public init(edge: Edge, eachwayPlaces: Int? = nil, offset: Int? = nil, edgePrice: Odds? = nil,
                edgeEachwayAvgPrice: Odds? = nil, tokenId: String? = nil, generosity: Double? = nil,
                edgeMaxStake: Double? = nil, edgeMaxStakeEachway: Double? = nil) {
        self.edge = edge
        self.eachwayPlaces = eachwayPlaces
        self.offset = offset
        self.edgePrice = edgePrice
        self.edgeEachwayAvgPrice = edgeEachwayAvgPrice
        self.tokenId = tokenId
        self.generosity = generosity
        self.edgeMaxStake = edgeMaxStake
        self.edgeMaxStakeEachway = edgeMaxStakeEachway
    }

}
