//
//  LocationService.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 26/06/2024.
//

import Foundation
import CoreLocation

protocol LocationService: Sendable {
    func locationName(for location: CLLocation) async throws -> String
    var locationUpdates: AsyncStream<LocationUpdate> { get }
}
