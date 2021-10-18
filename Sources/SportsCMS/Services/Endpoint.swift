import Vapor

enum Endpoint {

    case nodes(tag: Tag, liveAtDate: Date = Date())

    func uri(with configuration: CMSConfiguration) -> URI {
        switch self {
        case .nodes(let tag, let liveAtDate):
            let dateFormatter = ISO8601DateFormatter()
            var uri = configuration.baseURI
            uri.path += "/nodes"
            uri.query = "tag=\(tag)&live-at-date=\(dateFormatter.string(from: liveAtDate))"
            return uri
        }
    }

}
