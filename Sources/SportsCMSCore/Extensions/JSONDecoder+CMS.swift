import Vapor

extension JSONDecoder {

    static var cms: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }

}

extension Application {

    var cmsDecoder: JSONDecoder {
        .cms
    }

}

extension Request {

    var cmsDecoder: JSONDecoder {
        application.cmsDecoder
    }

}
