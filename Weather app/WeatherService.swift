import Foundation

struct WeatherResponse: Decodable {
    let main: Main
    let weather: [WeatherInfo]
    let wind: Wind
}

struct Main: Decodable {
    let temp: Double
    let humidity: Double
    let tempMin: Double
    let tempMax: Double
}

struct WeatherInfo: Decodable {
    let description: String
    let icon: String
}

struct Wind: Codable {
    let speed: Double
}

class WeatherService {
    
    let weatherAPIKey = "xxxxx" // Open Weather API
    
    func loadWeatherData(city: String, completion: @escaping (Weather) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(weatherAPIKey)&units=metric") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                if let weatherResponse = try? decoder.decode(WeatherResponse.self, from: data) {
                    print("Weather Response: \(weatherResponse)")
                    
                    let weather = Weather(city: city,
                                          temperature: Int(round(weatherResponse.main.temp)),
                                          speed: Int(round(weatherResponse.wind.speed)),
                                          tempMin: Int(round(weatherResponse.main.tempMin)),
                                          tempMax: Int(round(weatherResponse.main.tempMax)),
                                          humidity: Int(round(weatherResponse.main.humidity)),
                                          description: weatherResponse.weather.first?.description ?? "",
                                          iconName: weatherResponse.weather.first?.icon ?? "01d")
                    completion(weather)
                }
            } else if let error = error {
                print("Unable to load weather data: \(error.localizedDescription)")
            }
        }.resume()
    }
    
}
