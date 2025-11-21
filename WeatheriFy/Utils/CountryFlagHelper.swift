//
//  CountryFlagHelper.swift
//  WeatheriFy
//
//  Created by Developer on 21/11/25.
//

import Foundation

func countryFlag(from code: String) -> String {
    code
        .uppercased()
        .unicodeScalars
        .map { 127397 + $0.value }
        .compactMap(UnicodeScalar.init)
        .map(String.init)
        .joined()
}
