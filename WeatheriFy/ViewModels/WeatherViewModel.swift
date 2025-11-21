import SwiftUI
import MapKit
import Combine

class WeatherViewModel: ObservableObject {

    @Published var responseText = ""
    @Published var markerCoordinate = CLLocationCoordinate2D(latitude: 37.7793, longitude: -122.4193)
    @Published var countryCode = ""
    @Published var camera = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7793, longitude: -122.4193),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    @Published var cityName = ""
    @Published var temperature = 0.0
    @Published var condition = ""
    @Published var description = ""
    @Published var weatherIcon = ""
    @Published var sunRise = 0.0
    @Published var sunSet = 0.0


    private let service = WeatherService()

    func fetchWeather(for city: String) {

        guard !city.isEmpty else {
            responseText = "City name cannot be empty."
            return
        }

        responseText = "Fetching weather for \(city)..."

        service.fetchWeather(for: city) { [weak self] model in
            guard let self = self else { return }

            DispatchQueue.main.async {
                if let model = model {
                    self.responseText = model.jsonString
                    self.countryCode = model.countryCode
                    self.markerCoordinate = model.coordinate
                    self.cityName = model.cityName
                    self.temperature = model.temperature
                    self.condition = model.condition
                    self.description = model.description
                    self.weatherIcon = model.weatherIcon
                    self.sunRise = model.sunRise
                    self.sunSet = model.sunSet

                    // update camera
                    self.camera = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: model.coordinate,
                            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                        )
                    )
                } else {
                    self.responseText = "Failed to load weather data."
                }
            }
        }
    }
}
