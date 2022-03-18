import Foundation
import SCAN
import SMP
import SportsCMS

extension ISPSportsbookConfiguration {

    public static var environment: ISPSportsbookConfiguration {
        .init(scanConfiguration: .environment, smpConfiguration: .environment, cmsConfiguration: .environment)
    }

    init(scanConfiguration: SCANConfiguration, smpConfiguration: SMPConfiguration, cmsConfiguration: CMSConfiguration) {
        self.init(scanBaseURL: scanConfiguration.baseURL, smpBaseURL: smpConfiguration.baseURL,
                  tlaAPIKey: scanConfiguration.apiKey, cmsBaseURL: cmsConfiguration.baseURL,
                  cmsAPIKey: cmsConfiguration.apiKey)
    }

    var scanConfiguration: SCANConfiguration {
        .init(baseURL: self.scanBaseURL, apiKey: self.tlaAPIKey)
    }

    var smpConfiguration: SMPConfiguration {
        .init(baseURL: self.smpBaseURL, apiKey: self.tlaAPIKey)
    }

    var cmsConfiguration: CMSConfiguration {
        .init(baseURL: self.cmsBaseURL, apiKey: self.cmsAPIKey)
    }

}
