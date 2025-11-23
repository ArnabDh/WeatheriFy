//
//  SunTimeCalculator.swift
//  WeatheriFy
//
//  Created by Developer on 21/11/25.
//

import Foundation

struct SunTimeCalculator {
    
    static func formatTime(epoch: TimeInterval, timezoneOffset: Int) -> String {
        
        let date = Date(timeIntervalSince1970: epoch)

        //Format the output
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        
        formatter.dateFormat = DateFormatter.dateFormat(
            fromTemplate: "jm",
            options: 0,
            locale: Locale.current
        )
        formatter.timeZone = TimeZone(secondsFromGMT: timezoneOffset)

        return formatter.string(from: date)
    }

    static func getSunTimes(
        sunrise: TimeInterval,
        sunset: TimeInterval,
        timezone: Int
    ) -> (sunrise: String, sunset: String) {
        
        return (
            sunrise: formatTime(epoch: sunrise, timezoneOffset: timezone),
            sunset: formatTime(epoch: sunset, timezoneOffset: timezone)
        )
    }
}

