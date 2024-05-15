//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Bera Bekir Baykal on 15.05.2024.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    //Open Weather API: 3c8464b2988645a130912f8945aa6188
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=3c8464b2988645a130912f8945aa6188&units=metric") else {fatalError("Something went wrong...")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data,res) = try await URLSession.shared.data(for: urlRequest)
        
        guard (res as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching weather data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
    
}

struct ResponseBody: Decodable {
    
    var coordinat: CoordianteResponse
    var weather: [ WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    
    struct CoordianteResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double {return feels_like}
    var tempMin: Double {return temp_min}
    var tempMax: Double {return temp_max}
    
}
