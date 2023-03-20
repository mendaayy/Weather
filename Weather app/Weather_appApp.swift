//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Pranav Sai on 12/10/22.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: WeatherViewModel(weatherService: WeatherService()))
        }
    }
}
