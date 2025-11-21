//
//  SearchBar.swift
//  WeatheriFy
//
//  Created by Developer on 21/11/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var cityName: String
    var onSearch: () -> Void

    var body: some View {
        HStack {
            TextField("Enter city...", text: $cityName)
                .textFieldStyle(.roundedBorder)
                .submitLabel(.search)
                .onSubmit { onSearch() }

            Button {
                onSearch()
            } label: {
                Image(systemName: "magnifyingglass")
                    .padding(10)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
