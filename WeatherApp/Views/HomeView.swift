//
//  HomeView.swift
//  WeatherApp
//
//  Created by Yusuf Karan on 27.08.2023.
//

import SwiftUI

struct HomeView: View {
  var weather: WeatherData
  
    var body: some View {
      ZStack(alignment: .leading) {
        VStack {
          VStack(alignment: .leading, spacing: 5) {
            Text(weather.name)
              .bold().font(.title)
            
            Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
              .fontWeight(.light)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          
          Spacer()
          
          VStack {
            HStack {
              VStack(spacing: 20) {
                Image(systemName: "cloud")
                  .font(.system(size: 40))
                
                Text(weather.weather[0].main)
              }
              .frame(width: 150, alignment: .leading)
              
              Spacer()
              
              Text(weather.main.feels_like.roundDouble() + "°")
                .font(.system(size: 100))
                .fontWeight(.bold)
                .padding()
            }
            
            Spacer()
              .frame(height: 80)
            
            AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2021/01/04/19/18/city-5888619_1280.png")) { image in image .resizable().aspectRatio(contentMode: .fit).frame(width: 350)
            } placeholder: {
              ProgressView()
            }
            
            Spacer()
            
          }
          .frame(maxWidth: .infinity)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        
        VStack {
          Spacer()
          
          VStack(alignment: .leading, spacing: 20) {
            Text("Weather Now")
              .bold()
              .padding(.bottom)
            
            HStack {
              WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.temp_min.roundDouble() + "°"))
              Spacer()
              WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.temp_max.roundDouble() + "°"))
            }
            
            HStack {
              WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s"))
              Spacer()
              WeatherRow(logo: "humidity", name: "Humidity", value: (String(weather.main.humidity) + "%"))

            }
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding()
          .padding(.bottom, 20)
          .foregroundColor(.black)
          .background(.white)
          .cornerRadius(20, corners: [.topLeft,.topRight])
        }
        
      }
      .edgesIgnoringSafeArea(.bottom)
      .background(Color(hue: 0.108, saturation: 1.0, brightness: 0.975))
      .preferredColorScheme(.dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(weather: previewWeather)
    }
}
