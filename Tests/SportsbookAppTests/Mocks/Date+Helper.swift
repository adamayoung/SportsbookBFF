import Foundation

extension Date {

    init(iso8601String: String) {
        let dateFormatter = ISO8601DateFormatter()
        self = dateFormatter.date(from: iso8601String)!
    }

}
