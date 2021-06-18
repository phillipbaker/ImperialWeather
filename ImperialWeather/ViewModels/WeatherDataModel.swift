//
//  WeatherDataModel.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import CoreLocation
import Foundation

final class WeatherDataModel: NSObject, ObservableObject {
    
    enum LoadingState {
        case idle
        case loading
        case failed
        case loaded
    }
    
//    var locationManager = LocationManager()
    private var weatherRequest: APIRequest<CurrentWeatherResource>?

    @Published var loadingState = LoadingState.idle
    @Published private(set) var forecast = Forecast(coordinates: Coordinates(longitude: 0.0, latitude: 0.0), description: [WeatherDescription(id: 0, description: "Updating Weather...")], conditions: Conditions(temperature: 0.0), location: nil)

    func fetchCurrentWeather(location: CLLocationCoordinate2D?) {
        if let location = location {
            let latitude = String(location.latitude)
            let longitude = String(location.longitude)
            
            let resource = CurrentWeatherResource(latitude: latitude, longitude: longitude)
            let request = APIRequest(resource: resource)
            
            self.weatherRequest = request
            request.execute { [weak self] forecast in
                self?.forecast = forecast ?? TestData.forecast
            }
        } else {
            print("No location data received.")
        }
     
    }
}

