import Foundation

struct WeatherResponse: Codable {
    let main: Main
    let weather: [WeatherInfo]
}

struct Main: Codable {
    let temp: Double
}

struct WeatherInfo: Codable {
    let description: String
    let icon: String
}

class WeatherService {
    
    let weatherAPIKey = "c6faa58d997fcf8caff5e3e6ecb195fe"
    
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
                    
                    let weather = Weather(city: city, temperature: Int(round(weatherResponse.main.temp)), description: weatherResponse.weather.first?.description ?? "", iconName: weatherResponse.weather.first?.icon ?? "01d")
                    completion(weather)
                }
            } else if let error = error {
                print("Unable to load weather data: \(error.localizedDescription)")
            }
        }.resume()
    }
    
}

/*
 import Foundation

 struct WeatherResponse: Codable {
     let main: Main
     let weather: [WeatherInfo]
     let hourly: [HourlyForecast]
 }

 struct Main: Codable {
     let temp: Double
 }

 struct WeatherInfo: Codable {
     let description: String
     let icon: String
 }

 struct HourlyForecast: Codable {
     let dt: Int
     let main: Main
     let weather: [WeatherInfo]
 }

 class WeatherService {
     
     let weatherAPIKey = "c6faa58d997fcf8caff5e3e6ecb195fe"
     
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
                     
                     let weather = Weather(city: city, temperature: Int(round(weatherResponse.main.temp)), description: weatherResponse.weather.first?.description ?? "", iconName: weatherResponse.weather.first?.icon ?? "01d")
                     completion(weather)
                 }
             } else if let error = error {
                 print("Unable to load weather data: \(error.localizedDescription)")
             }
         }.resume()
     }
     
     func loadHourlyData(city: String, completion: @escaping (WeatherResponse) -> ()) {
             guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(weatherAPIKey)&units=metric") else {
                 print("Invalid URL")
                 return
             }
             
             URLSession.shared.dataTask(with: url) { data, response, error in
                 if let data = data {
                     let decoder = JSONDecoder()
                     decoder.keyDecodingStrategy = .convertFromSnakeCase
                     
                     if let weatherResponse = try? decoder.decode(WeatherResponse.self, from: data) {
                         print("Hourly Weather Response: \(weatherResponse)")
                         completion(weatherResponse)
                     }
                 } else if let error = error {
                     print("Unable to load hourly weather data: \(error.localizedDescription)")
                 }
             }.resume()
         }
     
 }

 */
