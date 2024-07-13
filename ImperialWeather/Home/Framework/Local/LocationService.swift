//
//  LocationService.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 26/06/2024.
//

import Foundation
import CoreLocation

protocol LocationService: Sendable {
    func startUpdatingLocation()
    func requestWhenInUseAuthorization()
    func locationName(for location: CLLocation) async throws -> String
    var locationEvents: AsyncStream<LocationEvent> { get }
}
