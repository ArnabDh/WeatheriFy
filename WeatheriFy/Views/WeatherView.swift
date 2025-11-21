import SwiftUI
import MapKit

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var cityName = ""

    var body: some View {
        VStack(spacing: 5) {
            
            //Map Section
            MapSection(viewModel: viewModel)

            //Search Bar
            SearchBar(cityName: $cityName, onSearch: {
                viewModel.fetchWeather(for: cityName)
            })

            //Weather Card & SunTime Card
            ScrollView {
                WeatherCard(viewModel: viewModel)
                SunCard(viewModel: viewModel)
            }
        }
    }
}
