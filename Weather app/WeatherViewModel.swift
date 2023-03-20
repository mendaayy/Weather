import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    @Published var cityName: String = ""
    @Published var temperature: Int = 0
    @Published var weatherDescription: String = ""
    @Published var iconName: String = ""
    
    private let weatherService: WeatherService
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func refresh(city: String) {
        weatherService.loadWeatherData(city: city) { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = weather.temperature
                self.weatherDescription = weather.description.capitalized
                self.iconName = weather.iconName.lowercased()
            }
        }
    }

    
}

/*
 import Foundation
 import Combine

 class WeatherViewModel: ObservableObject {
     
     @Published var cityName: String = ""
     @Published var temperature: Int = 0
     @Published var weatherDescription: String = ""
     @Published var iconName: String = ""
     @Published var hourlyForecastData: WeatherResponse?
     
     private let weatherService: WeatherService
     
     init(weatherService: WeatherService) {
         self.weatherService = weatherService
     }
     
     func refresh(city: String) {
         weatherService.loadWeatherData(city: city) { weather in
             DispatchQueue.main.async {
                 self.cityName = weather.city
                 self.temperature = weather.temperature
                 self.weatherDescription = weather.description.capitalized
                 self.iconName = weather.iconName.lowercased()
             }
         }
         weatherService.loadHourlyData(city: city) { hourlyData in
             DispatchQueue.main.async {
                 self.hourlyForecastData = hourlyData
             }
         }
     }

     
 }

 */
