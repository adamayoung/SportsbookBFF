import Vapor

extension Request {

    var cmsEnvironment: CMSEnvironment {
        let name = headers.first(name: .cmsEnvironment)?.uppercased() ?? ""
        return CMSEnvironment(rawValue: name) ?? .default
    }

}
