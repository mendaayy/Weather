import Foundation

class ForecastViewModel {
    var forecasts: [Forecast] = []
    var currentForecast: Forecast

    init() {
        // You can fetch forecast data from an API or set it manually here
        self.forecasts = [
            Forecast(week: "Mon", date: "14 Feb", icon: "sun.max.fill", temperature: "20°"),
            Forecast(week: "Tue", date: "15 Feb", icon: "cloud.sun.fill", temperature: "18°"),
            Forecast(week: "Wed", date: "16 Feb", icon: "cloud.sun.rain.fill", temperature: "15°"),
            Forecast(week: "Thur", date: "17 Feb", icon: "cloud.fill", temperature: "14°"),
            Forecast(week: "Fri", date: "18 Feb", icon: "cloud.bolt.rain.fill", temperature: "16°"),
            Forecast(week: "Sat", date: "19 Feb", icon: "cloud.fill", temperature: "14°"),
            Forecast(week: "Sun", date: "20 Feb", icon: "cloud.fill", temperature: "14°")
        ]
        
        // Set the current forecast
        self.currentForecast = Forecast(
            location: "Eindhoven",
            week: "Today°",
            date: "14 Feb",
            temperature: "18°",
            description: "Partly cloudy",
            hi: "22°",
            lo: "14°"
        )
    }
}

struct Forecast: Hashable {
    var location: String?
    var week: String
    var date: String
    var icon: String?
    var temperature: String
    var description: String?
    var hi: String?
    var lo: String?
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(week)
            hasher.combine(date)
            hasher.combine(icon)
            hasher.combine(temperature)
        }
}
