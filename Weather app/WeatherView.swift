import SwiftUI

struct ForecastView: View {
    var viewModel: ForecastViewModel
    
    var body: some View {
        VStack() {
            // Display the current forecast
            VStack() {
                if let location = viewModel.currentForecast.location {
                    Text(location)
                        .font(.title)
                }
                Text(viewModel.currentForecast.temperature)
                    .font(.system(size: 85))
                if let description = viewModel.currentForecast.description {
                    Text(description)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                }
                HStack() {
                    Text("H:")
                        .padding(.trailing, -7.0)
                    if let hi = viewModel.currentForecast.hi {
                        Text(hi)
                            .padding(.trailing, 4.0)
                    }
                    
                    Text("L:")
                        .padding(.trailing, -7.0)
                    if let lo = viewModel.currentForecast.lo {
                        Text(lo)
                    }
                }
                .padding(.top, 1.0)
                .font(.title3)
                .foregroundColor(Color.black)
                Spacer()
            }
            .padding(.top, 100.0)
            .frame(width: 250.0, height: 500.0)
            
            VStack(){
                HStack(spacing: 62.0) {
                    Text("Hourly Forecast")
                        .foregroundColor(Color.gray)
                    Text("Weekly Forecast")
                        .bold()
                }
                .frame(width: 320.0)
                .font(.headline)
                .padding(.top, 30.0)
                Spacer()
                Divider()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(viewModel.forecasts, id: \.self) { forecast in
                            VStack {
                                Text(forecast.week)
                                    .font(.headline)
                                Text(forecast.date)
                                    .font(.subheadline)
                                    .padding(.bottom)
                                if let icon = forecast.icon {
                                    Image(systemName: icon)
                                        .padding(.bottom)
                                        .frame(height: 40.0)
                                        .font(.system(size: 30))
                                        .foregroundColor(Color.blue)
                                }
                                Text(forecast.temperature)
                                    .font(.title2)
                                    .bold()
                            }
                            .frame(width: 48.0, height: 150.0)
                            .padding(.all, 10.0)
                            .background(forecast.week == "Tue" ?  Color(UIColor.init(red: 0.6, green: 0.8, blue: 0.8, alpha: 0.3)) : Color.white)
                            .cornerRadius(40)
                            .shadow(radius: 5)
                        }
                        
                    }
                    .padding(.leading, 40.0)
                    .padding(.top, 10.0)
                    .frame(width: nil, height: 200.0)
                    Spacer()
                }
            }
            .frame(height: 400.0)
            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.949))
            .cornerRadius(55)
            Spacer()
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(viewModel: ForecastViewModel())
    }
}
