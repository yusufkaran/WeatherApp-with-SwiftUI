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
          Text("Hava Durumu Verisi Çekildi!")
        } else {
          
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
    .background(Color(.gray))
    .preferredColorScheme(.dark)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
