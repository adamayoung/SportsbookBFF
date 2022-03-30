import Foundation

public protocol TLAConfigurationProviding {

    var tlaName: String { get }

    var baseURL: String { get }

    var apiKey: String { get }

}
