//
//  WeatherCard.swift
//  WeatheriFy
//
//  Created by Developer on 21/11/25.
//

import SwiftUI

struct WeatherCard: View {
    @ObservedObject var viewModel: WeatherViewModel

    var body: some View {

        if viewModel.cityName.isEmpty {
            VStack {
                Text("Search a city to get weather 🌦")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            }
        } else {
            
            VStack(spacing: 14) {

                Text(viewModel.cityName)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white.opacity(0.95))

                HStack(spacing: 16) {

                    Text("\(Int(viewModel.temperature))°")
                        .font(.system(size: 72, weight: .bold))
                        .foregroundColor(.white)

                    AsyncImage(url: URL(string: weatherIconURL(from: viewModel.weatherIcon))) { img in
                        img.resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    } placeholder: {
                        ProgressView()
                    }
                }

                Text(viewModel.description.capitalized)
                    .font(.title3)
                    .foregroundColor(.black.opacity(0.85))

                Divider()
                    .background(.white.opacity(0.4))

                HStack(spacing: 32) {

                    MetricItem(label: "Feels Like",
                               value: "\(Int(viewModel.feels_like))°")

                    MetricItem(label: "Humidity",
                               value: "\(viewModel.humidity)%")

                    MetricItem(label: "Wind",
                               value: "\(viewModel.windSpeed)m/s")

                    MetricItem(label: "Pressure",
                               value: "\(viewModel.pressure)")
                }
            }
            .padding(18)
            .background(.ultraThinMaterial)
            .cornerRadius(22)
            .shadow(color: .black.opacity(0.25),
                    radius: 8, x: 0, y: 4)
            .padding(.horizontal)
        }
    }
}


// MARK: - Subcomponent for Mini Metric Blocks
struct MetricItem: View {
    let label: String
    let value: String

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.headline.bold())
                .foregroundColor(.black)

            Text(label)
                .font(.caption)
                .foregroundColor(.black.opacity(0.7))
        }
    }
}
