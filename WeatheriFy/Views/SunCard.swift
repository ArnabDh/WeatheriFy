//
//  SunCard.swift
//  WeatheriFy
//
//  Created by Developer on 21/11/25.
//

import SwiftUI

struct SunCard: View {
    @ObservedObject var viewModel: WeatherViewModel

    var body: some View {

        if !viewModel.cityName.isEmpty {

            let sunTimes = SunTimeCalculator.getSunTimes(
                sunrise: viewModel.sunRise,
                sunset: viewModel.sunSet
            )

            VStack(spacing: 12) {
                
                Text("Sun Times")
                    .font(.headline)
                    .foregroundColor(.white)

                HStack(spacing: 40) {

                    VStack {
                        Image(systemName: "sunrise.fill")
                            .foregroundColor(.white.opacity(0.8))
                        Text(sunTimes.sunrise)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }

                    VStack {
                        Image(systemName: "sunset.fill")
                            .foregroundColor(.white.opacity(0.8))
                        Text(sunTimes.sunset)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                }
            }
            .padding()
            .background(.orange)
            .cornerRadius(16)
            .shadow(radius: 4)
            .padding(.top, 10)
        }
    }
}
