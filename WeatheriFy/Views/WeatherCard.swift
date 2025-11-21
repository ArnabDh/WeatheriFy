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

        VStack(spacing: 10) {

            if viewModel.cityName.isEmpty {
                Text("Search a city to get weather 🌦")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            } else {
                VStack(spacing: 8) {

                    Text(viewModel.cityName)
                        .font(.largeTitle)
                        .bold()

                    Text("\(Int(viewModel.temperature))°C")
                        .font(.system(size: 60))
                        .bold()

                    AsyncImage(url: URL(string: weatherIconURL(from: viewModel.weatherIcon))) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                    } placeholder: {
                        ProgressView()
                    }

                    Text(viewModel.description.capitalized)
                        .font(.title3)
                        .foregroundColor(.black)
                }
                .padding()
                .background(.teal)
                .cornerRadius(16)
                .shadow(radius: 4)
                .padding(.top, 10)
            }

        }
    }
}
