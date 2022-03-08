import Foundation

extension JSONDecoder {

    static var tla: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.tla)
        return decoder
    }

}
