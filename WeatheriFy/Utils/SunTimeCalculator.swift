//
//  SunTimeCalculator.swift
//  WeatheriFy
//
//  Created by Developer on 21/11/25.
//

import Foundation

struct SunTimeCalculator {

    static func formatTime(epoch: TimeInterval) -> String {

        let date = Date(timeIntervalSince1970: epoch)

        //Format the output
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"

        return formatter.string(from: date)
    }

    static func getSunTimes(
        sunrise: TimeInterval,
        sunset: TimeInterval,
    ) -> (sunrise: String, sunset: String) {

        let sunriseTime = formatTime(epoch: sunrise)
        let sunsetTime = formatTime(epoch: sunset)

        return (sunriseTime, sunsetTime)
    }
}

