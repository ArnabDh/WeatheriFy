//
//  AQICard.swift
//  WeatheriFy
//

import SwiftUI

struct AQICard: View {
    @ObservedObject var viewModel: WeatherViewModel
    @ObservedObject var aqiViewModel: AQIViewModel

    var body: some View {
        
        if !viewModel.cityName.isEmpty {
            VStack(spacing: 16) {
                
                // AQI Value
                Text("Air Quality")
                    .font(.headline)
                    .foregroundColor(.black.opacity(0.85))
                
                Text("\(aqiViewModel.aqi)")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(colorForAQI(aqiViewModel.aqi))
                
                Divider().background(.white.opacity(0.6))
                
                // POLLUTANTS
                VStack(alignment: .leading, spacing: 8) {
                    pollutantRow(label: "PM2.5", value: aqiViewModel.PM25, unit: "µg/m³")
                    pollutantRow(label: "PM10", value: aqiViewModel.PM10, unit: "µg/m³")
                    pollutantRow(label: "SO₂",  value: aqiViewModel.SO2,  unit: "µg/m³")
                    pollutantRow(label: "NO₂",  value: aqiViewModel.NO2,  unit: "µg/m³")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(18)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.25),
                    radius: 8, x: 0, y: 4)
            .padding(.horizontal)
        }
    }
}

/// MARK: - Helper UI Components
private extension AQICard {
    func pollutantRow(label: String, value: Double, unit: String) -> some View {
        HStack {
            Text(label)
                .font(.body.bold())
            Spacer()
            Text("\(value, specifier: "%.1f") \(unit)")
                .font(.body)
        }
        .foregroundColor(.black.opacity(0.9))
    }
    
    /// Simple AQI Color Scale
    func colorForAQI(_ aqi: Int) -> Color {
        switch aqi {
        case 1: return .green
        case 2: return .yellow
        case 3: return .orange
        case 4: return .red
        case 5: return .purple
        default: return .white
        }
    }
}
