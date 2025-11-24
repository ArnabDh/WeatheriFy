//
//  DayProgressBar.swift
//  WeatheriFy
//
//  Created by Developer on 23/11/25.
//

import SwiftUI

struct DayProgressBar: View {
    let sunrise: TimeInterval
    let sunset: TimeInterval
    let timezone: Int
    @ObservedObject var viewModel: WeatherViewModel

    var body: some View {
        if !viewModel.weatherIcon.isEmpty {
            
            GeometryReader { geo in
                let width = geo.size.width * 0.85
                let progress = DayProgressCalculator.progress(sunrise: sunrise, sunset: sunset)
                
                VStack(spacing: 12) {
                    
                    // Sunrise / Sunset labels
                    HStack {
                        Text(DayProgressCalculator.format(epoch: sunrise, timezoneOffset: timezone))
                        Spacer()
                        Text(DayProgressCalculator.format(epoch: sunset, timezoneOffset: timezone))
                    }
                    .font(.footnote.bold())
                    .foregroundColor(.black.opacity(0.85))
                    
                    ZStack(alignment: .leading) {
                        
                        // Background track
                        Capsule()
                            .fill(.white.opacity(0.25))
                            .frame(width: width, height: 8)
                        
                        // Progress bar
                        Capsule()
                            .fill(
                                LinearGradient(
                                    colors: [.yellow, .orange],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: width * progress, height: 8)
                            .animation(.easeInOut(duration: 0.6), value: progress)
                        
                        // Moving sun icon
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.yellow)
                            .offset(x: width * progress - 12, y: 0)
                            .shadow(radius: 4)
                            .animation(
                                .spring(response: 0.4, dampingFraction: 0.8),
                                value: progress
                            )
                    }
                }
                .padding()
                .background(.thinMaterial)
                .cornerRadius(18)
                .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 2)
                .padding(.horizontal)
            }
            .frame(height: 110)
        }
    }
}
