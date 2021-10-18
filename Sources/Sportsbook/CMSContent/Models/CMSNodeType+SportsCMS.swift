import Foundation
import SportsCMS

extension CMSNodeType {

    init(type: SportsCMS.CMSNodeType) {
        switch type {
        case .sport: self = .sport
        case .competition: self = .competition
        case .event: self = .event
        case .staticBanner: self = .staticBanner
        case .marketType: self = .marketType
        }
    }

}
