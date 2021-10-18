import Foundation
import Graphiti

extension NoArguments {

    static var mock: NoArguments {
        (try? JSONDecoder().decode(NoArguments.self, from: "{}".data(using: .utf8)!))!
    }

}
