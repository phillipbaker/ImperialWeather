//
//  LocationManager.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, ObservableObject {
    @Published var status: CLAuthorizationStatus
    @Published var location: CLLocationCoordinate2D?
   
    private let locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        self.status = .notDetermined
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else { return }
        self.location = location
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
