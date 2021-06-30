//
//  LocationManager.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import CoreLocation
import Foundation

protocol LocationManagerDelegate: AnyObject {
    func locationManager(_ locationManager: LocationManager, didUpdate location: CLLocationCoordinate2D)
    func locationManager(_ locationManager: LocationManager, didUpdate status: CLAuthorizationStatus)
    func locationManager(_ locationManger: LocationManager, didFailWith error: WeatherError?)
}

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    weak var delegate: LocationManagerDelegate?
    
    override init() {
        super.init()
        manager.delegate = self
        requestLocation()
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        // TODO: - Is there a way to respond to user rejecting location permission?
        manager.requestLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        delegate?.locationManager(self, didUpdate: status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else { return }
        manager.stopUpdatingLocation()
        delegate?.locationManager(self, didUpdate: location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.locationManager(self, didFailWith: error as? WeatherError)
    }
}
