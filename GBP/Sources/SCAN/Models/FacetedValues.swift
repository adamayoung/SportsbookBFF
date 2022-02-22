import Foundation

public struct FacetedValues: Equatable, Codable {

    public let key: AttachmentKey?
    public let value: String?
    public let time: String?
    public let cardinality: Int
    public let next: FacetResultNode?

    public init(key: AttachmentKey? = nil, value: String? = nil, time: String? = nil, cardinality: Int,
                next: FacetResultNode? = nil) {
        self.key = key
        self.value = value
        self.time = time
        self.cardinality = cardinality
        self.next = next
    }

}
