import Foundation
import WebSocketKit

extension WebSocket {

    func send<Model: Encodable>(_ model: Model, encoder: JSONEncoder = .init()) {
        guard let data = try? encoder.encode(model), let text = String(data: data, encoding: .utf8) else {
            return
        }

        send(text, promise: nil)
    }

}
