//
//  DayProgressCalculator.swift
//  WeatheriFy
//

import Foundation

struct DayProgressCalculator {

    /// Convert epoch → Date object
    static func epochToDate(_ epoch: TimeInterval) -> Date {
        Date(timeIntervalSince1970: epoch)
    }

    /// Calculate progress between sunrise → sunset
    /// - Returns value between 0 and 1
    static func progress(sunrise: TimeInterval, sunset: TimeInterval) -> CGFloat {
        let sunriseDate = Date(timeIntervalSince1970: sunrise)
        let sunsetDate = Date(timeIntervalSince1970: sunset)
        let now = Date()

        if now <= sunriseDate { return 0 }
        if now >= sunsetDate { return 1 }

        let total = sunsetDate.timeIntervalSince(sunriseDate)
        let passed = now.timeIntervalSince(sunriseDate)
        return CGFloat(passed / total)
    }

    /// Format time into user-friendly string
    static func format(epoch: TimeInterval, timezoneOffset: Int) -> String {
        let date = Date(timeIntervalSince1970: epoch)

        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.timeZone = TimeZone(secondsFromGMT: timezoneOffset)

        formatter.dateFormat = DateFormatter.dateFormat(
            fromTemplate: "jm",
            options: 0,
            locale: formatter.locale
        )

        return formatter.string(from: date)
    }
}
