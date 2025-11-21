//
//  MapSection.swift
//  WeatheriFy
//
//  Created by Developer on 21/11/25.
//

import SwiftUI
import MapKit

struct MapSection: View {
    @ObservedObject var viewModel: WeatherViewModel

    var body: some View {
        Map(position: $viewModel.camera) {
            Marker("City Location", coordinate: viewModel.markerCoordinate)
                .tint(.blue)
        }
        .overlay(alignment: .topTrailing) {
            if !viewModel.countryCode.isEmpty {
                Text(countryFlag(from: viewModel.countryCode))
                    .font(.system(size: 50))
                    .padding(.top, 10)
                    .padding(.trailing, 12)
                    .shadow(radius: 5)
            }
        }
        .frame(height: 250)
    }
}
