import GBPCore
import Vapor

extension Application.SCANServices.Provider {

    public static func isp(baseURL: String, apiKey: String) -> Self {
        let configuration = SCANConfiguration.init(baseURL: baseURL, apiKey: apiKey)
        return isp(configuration)
    }

    public static func isp(_ configuration: SCANConfiguration) -> Self {
        .init {
            ISPSCANService(configuration: configuration, client: $0.gbpClient, logger: $0.logger)
        }
    }

}
