//
//  Onboarding.swift
//  WeatherApp
//
//  Created by Yusuf Karan on 27.08.2023.
//

import SwiftUI
import CoreLocationUI

struct Onboarding: View {
  @EnvironmentObject var locationManager: LocationManager
  
  
  var body: some View {
    VStack {
      VStack(spacing: 20) {
        Text("Weather App'e Hoş Geldin")
          .bold().font(.title)
        
        Text("Lütfen Güncel Konumunuzu Bulmayı Kabul Edin")
          .padding()
      }
      .multilineTextAlignment(.center)
      .padding()
      
      LocationButton(.shareCurrentLocation) {
        locationManager.requestLocation()
      }
      
      .cornerRadius(30)
      .symbolVariant(.fill)
      .foregroundColor(.white)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

struct Onboarding_Previews: PreviewProvider {
  static var previews: some View {
    Onboarding()
  }
}
 
