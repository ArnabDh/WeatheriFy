import Foundation
import CoreLocation

class WeatherService {

    func fetchWeather(for city: String, completion: @escaping (WeatherModel?) -> Void) {
        
        let key = Secrets.OPENWEATHER_API_KEY

        let urlString =
        "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(key)&units=metric"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in

            if let error = error {
                print("API Error:", error.localizedDescription)
                completion(nil)
                return
            }

            guard let data = data else {
                print("No API data")
                completion(nil)
                return
            }

            let jsonString = String(data: data, encoding: .utf8) ?? ""

            // Convert JSON
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {

                let country = (json["sys"] as? [String: Any])?["country"] as? String ?? ""
                let coord = json["coord"] as? [String: Any]
                let lat = coord?["lat"] as? Double ?? 0.0
                let lon = coord?["lon"] as? Double ?? 0.0
                let cityName = json["name"] as? String ?? ""
                let temperature = (json["main"] as? [String: Any])?["temp"] as? Double ?? 0.0
                let description = (json["weather"] as? [[String: Any]])?[0]["description"] as? String ?? ""
                let condition = (json["weather"] as? [[String: Any]])?[0]["main"] as? String ?? ""
                let weatherIcon = (json["weather"] as? [[String: Any]])?[0]["icon"] as? String ?? ""
                let sunRise = (json["sys"] as? [String: Any])?["sunrise"] as? TimeInterval ?? 0.0
                let sunSet = (json["sys"] as? [String: Any])?["sunset"] as? TimeInterval ?? 0.0
                let timezone = json["timezone"] as? Int ?? 0

                completion(
                    WeatherModel(
                        jsonString: jsonString,
                        coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon),
                        countryCode: country,
                        cityName: cityName,
                        temperature: temperature,
                        condition: condition,
                        description: description,
                        weatherIcon: weatherIcon,
                        sunRise: sunRise,
                        sunSet: sunSet,
                        timezone: timezone
                    )
                )
            } else {
                completion(nil)
            }

        }.resume()
    }
}
