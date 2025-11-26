import SwiftUI
import MapKit

struct WeatherView: View {
    @StateObject private var viewModel: WeatherViewModel
    @StateObject private var AQIviewModel = AQIViewModel()
    @State private var cityName = ""
    
    init() {
            let aqi = AQIViewModel()
            _AQIviewModel = StateObject(wrappedValue: aqi)
            _viewModel = StateObject(wrappedValue: WeatherViewModel(aqiVM: aqi))
        }

    var body: some View {
        ZStack {
            
            //Dynamic Weather Background
            WeatherBackground(condition: viewModel.condition)
                .ignoresSafeArea()
            
            VStack(spacing: 5) {
                
                //Map Section
                MapSection(viewModel: viewModel)

                //Search Bar
                SearchBar(cityName: $cityName, onSearch: {
                    viewModel.fetchWeather(for: cityName)
                })
                
                //Weather Cards Overlay
                ScrollView {
                    WeatherCard(viewModel: viewModel)
                    DayProgressBar(
                        sunrise: viewModel.sunRise,
                        sunset: viewModel.sunSet,
                        timezone: viewModel.timezone,
                        viewModel: viewModel
                    )
                    AQICard(viewModel: viewModel,aqiViewModel: AQIviewModel)
                }
            }
            .padding(.bottom, 8)
        }
    }
}
