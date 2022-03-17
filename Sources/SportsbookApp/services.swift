import ISPSportsbook
import Sportsbook
import Vapor

func setupServices(_ app: Application) {
    app.sportbooks.use(.isp(.environment))
}
