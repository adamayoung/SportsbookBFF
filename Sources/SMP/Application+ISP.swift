import GBPCore
import Vapor

extension Application.SMPServices.Provider {

    public static func isp(baseURL: String, apiKey: String) -> Self {
        let configuration = SMPConfiguration.init(baseURL: baseURL, apiKey: apiKey)
        return isp(configuration)
    }

    public static func isp(_ configuration: SMPConfiguration) -> Self {
        return .init {
            ISPSMPService(configuration: configuration, client: $0.gbpClient, logger: $0.logger)
        }
    }

}
