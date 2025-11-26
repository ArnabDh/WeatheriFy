import SwiftUI
import Combine
import CoreLocation

class AQIViewModel: ObservableObject {
    
    private let service = AQIService()
    
    @Published var responseText = ""
    
    @Published var aqi = 0
    @Published var PM25 = 0.0
    @Published var PM10 = 0.0
    @Published var SO2 = 0.0
    @Published var NO2 = 0.0
    
    func fetchAQI(lat: Double, lon: Double) {
        
        service.fetchAQI(lat: lat, lon: lon) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if let result = result {
                    self.aqi = result.aqi
                    self.PM25 = result.PM25
                    self.PM10 = result.PM10
                    self.SO2  = result.SO2
                    self.NO2  = result.NO2
                } else {
                    self.responseText = "Failed to load AQI data."
                }
            }
        }
    }
}
