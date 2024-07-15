//
//  LocationEventMocks.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 12/07/2024.
//

import CoreLocation
@testable import ImperialWeather

extension LocationUpdate {
    static let didUpdateLocation =  LocationUpdate.didUpdateLocation(
        CLLocation(latitude: 0.0, longitude: 0.0)
    )

    static let didFailWithLocationError = LocationUpdate.didFailWithError(.locationError)
    static let didFailWithPermissionError = LocationUpdate.didFailWithError(.permissionError)
}
