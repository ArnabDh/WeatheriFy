//
//  WeatherBackground.swift
//  WeatheriFy
//
//  Created by Developer on 23/11/25.
//

import SwiftUI

struct WeatherBackground: View {
    var condition: String

    var body: some View {
        LinearGradient(
            colors: gradientFor(condition),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
        .animation(.easeInOut(duration: 0.6), value: condition)
    }

    func gradientFor(_ condition: String) -> [Color] {
        switch condition.lowercased() {
        case "clear":
            return [.blue, .cyan]
        case "clouds":
            return [.gray.opacity(0.5), .gray]
        case "rain":
            return [.gray, .blue.opacity(0.5)]
        case "snow":
            return [.white, .blue.opacity(0.4)]
        case "thunderstorm":
            return [.black, .gray]
        default:
            return [.blue, .white]
        }
    }
}
