//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Yusuf Karan on 27.08.2023.
//

import Foundation
import CoreLocation

class WeatherManager {
  func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherData{
    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=#####API#####&units=metric")
    else { fatalError("Missing URL")}
    
    let urlRequest = URLRequest(url: url)
    
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    
    guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fething weather data") }
    
    let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
    
    return decodedData
  }
}

struct WeatherData: Decodable {
    let coord: Coordinate
    let weather: [WeatherInfo]
    let base: String
    let main: MainInfo
    let visibility: Int
    let wind: WindInfo
    let rain: RainInfo?
    let clouds: CloudInfo
    let dt: Int
    let sys: SystemInfo
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
  
    struct Coordinate: Decodable {
        let lon: Double
        let lat: Double
    }
    
    struct WeatherInfo: Decodable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    struct MainInfo: Decodable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Int
        let humidity: Int
        let sea_level: Int
        let grnd_level: Int
    }
    
    struct WindInfo: Decodable {
        let speed: Double
        let deg: Int
        let gust: Double
    }
    
    struct RainInfo: Decodable {
        let oneHour: Double
        
        enum CodingKeys: String, CodingKey {
            case oneHour = "1h"
        }
    }
    
    struct CloudInfo: Decodable {
        let all: Int
    }
    
    struct SystemInfo: Decodable {
        let type: Int
        let id: Int
        let country: String
        let sunrise: Int
        let sunset: Int
    }
}
