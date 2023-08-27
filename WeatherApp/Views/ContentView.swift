//
//  ContentView.swift
//  WeatherApp
//
//  Created by Yusuf Karan on 27.08.2023.
//

import SwiftUI

struct ContentView: View {
  @StateObject var locationManager = LocationManager()
  var weatherManager = WeatherManager()
  @State var weather: WeatherData?
  
  var body: some View {
    VStack {
      
      if let location = locationManager.location {
        if let weather = weather {
          HomeView(weather: weather)
        } else {
          LoadingView()
            .task {
              do {
                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
              } catch {
                  print("Error getting weather: \(error)")
              }
            }
        }
      } else {
        if locationManager.isLoading {
          LoadingView()
        } else {
          Onboarding()
            .environmentObject(locationManager)
        }
      }
    }
    .background(Color(hue: 0.108, saturation: 1.0, brightness: 0.975))
    .preferredColorScheme(.dark)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
