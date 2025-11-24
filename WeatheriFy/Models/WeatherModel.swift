//
//  WeatherModel.swift
//  WeatheriFy
//
//  Created by Developer on 21/11/25.
//

import Foundation
import CoreLocation

struct WeatherModel {
    let jsonString: String
    let coordinate: CLLocationCoordinate2D
    let countryCode: String
    let cityName: String
    let temperature: Double
    let condition: String
    let description: String
    let weatherIcon: String
    let sunRise: TimeInterval
    let sunSet: TimeInterval
    let timezone: Int
    let pressure: Int
    let humidity: Int
    let feels_like: Double
    let windSpeed: Double
}
