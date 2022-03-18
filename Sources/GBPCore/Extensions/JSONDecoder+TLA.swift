import Vapor

extension JSONDecoder {

    static var tla: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.tla)
        return decoder
    }

}

extension Application {

    var tlaDecoder: JSONDecoder {
        .tla
    }

}

extension Request {

    var tlaDecoder: JSONDecoder {
        application.tlaDecoder
    }

}
