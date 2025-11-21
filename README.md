# 🌦️ WeatheriFy — iOS Weather App (SwiftUI + MVVM)

WeatheriFy is a modern iOS weather application built using **SwiftUI**, **MVVM architecture**, **MapKit**, and the **OpenWeather API**.  
It displays live weather details, map location, country flag, sunrise/sunset times, and real API weather icons — all inside a clean, modular UI.

---

## 📸 App Overview

WeatheriFy provides:

- 🌍 Search-based weather lookup  
- 🗺 Dynamic map centered on the selected city  
- 🚩 Country flag overlay  
- 🌤 Real OpenWeather icons (not SF Symbols)  
- 🌅 Sunrise & sunset (converted from epoch)  
- 🌡 Temperature & weather condition  
- ⚙️ Clean MVVM structure with reusable components  

---

## 🛠 Tech Stack

| Tool / Framework | Purpose |
|------------------|---------|
| **SwiftUI** | Declarative UI |
| **MVVM** | Clean architecture |
| **MapKit** | Map + marker updates |
| **Combine** | ViewModel → View updates |
| **OpenWeather API** | Weather data |
| **AsyncImage** | Displaying remote icons |
| **Utility Helpers** | Formatting + calculations |

---
### 🌤 Weather Lookup
Search any city to retrieve:
- Temperature  
- Weather condition & description  
- Weather icon  
- Coordinates  
- Country code  
- Sunrise time  
- Sunset time  

---

### 🗺 Live Map Integration
- Displays city on map using `MapKit`  
- Dynamic region + marker  
- Country flag overlay in top-right corner  

---
