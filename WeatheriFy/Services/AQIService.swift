//
//  AQIService.swift
//  WeatheriFy
//

import Foundation

class AQIService {
    
    func fetchAQI( lat: Double, lon: Double, completion: @escaping (AQIModel?) -> Void) {
        
        let key = Secrets.OPENWEATHER_API_KEY
        
        let urlString =
        "https://api.openweathermap.org/data/2.5/air_pollution?lat=\(lat)&lon=\(lon)&appid=\(key)"
        
        guard let url = URL(string: urlString) else {
            print("AQI URL invalid")
            completion(nil)
            return
        }
        
        print("AQI Request:", urlString)
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print("API error:", error)
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("AQI data empty")
                completion(nil)
                return
            }
            
            // Convert JSON
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                guard
                    let list = json["list"] as? [[String: Any]],
                    let first = list.first
               else {
                   completion(nil)
                   return
               }
                let components = first["components"] as? [String: Any]
                
                let aqi = (first["main"] as? [String: Any])?["aqi"] as? Int ?? 0
                let SO2 = components?["so2"] as? Double ?? 0.0
                let NO2 = components?["no2"] as? Double ?? 0.0
                let PM25 = components?["pm2_5"] as? Double ?? 0.0
                let PM10 = components?["pm10"] as? Double ?? 0.0
                
                completion(
                    AQIModel(aqi: aqi, SO2: SO2, NO2: NO2, PM25: PM25, PM10: PM10)
                )
                
            }else {
                completion(nil)
            }
        }.resume()
    }
}

