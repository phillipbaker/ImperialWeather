//
//  DependencyProvider.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 3/9/22.
//

import Foundation
import CoreLocation

enum DependencyProvider {
    static var weatherService: WeatherService {
        return WeatherService()
    }
    
    static var locationManager: CLLocationManager {
        return CLLocationManager()
    }
}
