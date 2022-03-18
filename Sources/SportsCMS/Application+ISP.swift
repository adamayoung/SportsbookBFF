import Vapor

extension Application.SportsCMSServices.Provider {

    public static func isp(baseURL: String, apiKey: String) -> Self {
        let configuration = CMSConfiguration.init(baseURL: baseURL, apiKey: apiKey)
        return isp(configuration)
    }

    public static func isp(_ configuration: CMSConfiguration) -> Self {
        .init {
            ISPSportsCMSService(configuration: configuration, client: $0.cmsClient, logger: $0.logger)
        }
    }

}
