//
//  Secrets.swift
//  WeatheriFy
//
//  Created by Developer on 21/11/25.
//

import Foundation

struct Secrets {
    static var OPENWEATHER_API_KEY: String {
        Bundle.main.object(forInfoDictionaryKey: "OPENWEATHER_API_KEY") as? String ?? ""
    }
}

