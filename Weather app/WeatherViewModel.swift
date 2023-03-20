import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    @Published var cityName: String = ""
    @Published var temperature: Int = 0
    @Published var speed: Int = 0
    @Published var tempMin: Int = 0
    @Published var tempMax: Int = 0
    @Published var humidity: Int = 0
    @Published var weatherDescription: String = ""
    @Published var iconName: String = "default"
    
    private let weatherService: WeatherService
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func refresh(city: String) {
        weatherService.loadWeatherData(city: city) { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = weather.temperature
                self.speed = weather.speed
                self.tempMin = weather.tempMin
                self.tempMax = weather.tempMax
                self.humidity = weather.humidity
                self.weatherDescription = weather.description.capitalized
                self.iconName = weather.iconName.lowercased()
            }
        }
    }

    
}
