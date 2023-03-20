import SwiftUI
import Foundation
import CoreLocation

struct ContentView: View {
    @State private var searchText = ""
    
    @ObservedObject var viewModel:
    WeatherViewModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack{
                    TextField("Enter city", text: $searchText, onCommit: {
                        viewModel.refresh(city: searchText)
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    
                }
                .padding()

                
                VStack() {
                    Text(viewModel.cityName)
                        .bold()
                        .font(.title)
                    
                    Text("\(viewModel.temperature)°")
                        .font(.system(size: 85))
                        .foregroundColor(.white)
                    
                    VStack(spacing: 20) {
                        Text(viewModel.weatherDescription)
                        
                        Image(systemName: "cloud")
                            .font(.system(size: 50))
                    }
                    .frame(width: 150)
                    
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                VStack {
                    
                    Image("House")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity)
            
            VStack {
                Spacer()
                VStack(spacing: 20) {
                    Text("Weather now")
                        .font(.title2)
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (String(viewModel.tempMin) + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (String(viewModel.tempMax) + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (String(viewModel.speed) + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (String(viewModel.speed) + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color.white)
                .background(Color(hue: 0.686, saturation: 0.458, brightness: 0.487))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .preferredColorScheme(.dark)
        .onAppear {
            viewModel.refresh(city: "Eindhoven")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}

