import SwiftUI
import Foundation
import CoreLocation

struct ContentView: View {
    @State private var isNight = false
    @ObservedObject var viewModel:
        WeatherViewModel
    
    var body: some View {
        ZStack {
            BackgroundView(top: isNight ? .black:.blue, bottom: isNight ? .gray:.white)
            
            VStack{
                CityTextView(cityName: viewModel.cityName)
                
                Spacer()
                HStack(spacing: 20){
                    WeatherDayView(dayofWeek: "Current",
                                   temperature: viewModel.temperature)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    weatherButton(title: "Change Time", textColor: .blue, bg: .white)
                }
                
                Spacer()
            }
            .onAppear {
                viewModel.refresh(city: "Eindhoven")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}


struct BackgroundView: View {
    var top: Color
    var bottom: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [top, bottom]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}


struct WeatherDayView: View {
    var dayofWeek:String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayofWeek)
                .foregroundColor(.blue)
            Text("\(temperature)")
                .foregroundColor(.purple)
        }
    }
}

struct CityTextView: View {
    var cityName : String
    var body: some View {
        Text(cityName)
            .foregroundColor(.black)
            .padding()
    }
}

struct MainWeather: View {
    var temp: String
    
    var body: some View{
        VStack(spacing:9){
            Text("\(temp)")
        }
    }
}
