import Vapor

extension Request {

    var locale: Locale {
        guard
            let identifier = headers.first(name: .acceptLanguage)?.replacingOccurrences(of: "-", with: "_"),
            Locale.availableIdentifiers.contains(identifier)
        else {
            return .default
        }

        return Locale(identifier: identifier)
    }

}
