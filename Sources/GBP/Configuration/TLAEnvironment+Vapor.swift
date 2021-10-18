import Vapor

extension Request {

    var tlaEnvironment: TLAEnvironment {
        let name = headers.first(name: .tlaEnvironment)?.uppercased() ?? ""
        return TLAEnvironment(rawValue: name) ?? .default
    }

    var tlaKey: String? {
        Environment.get("TLA_KEY")
    }

}
