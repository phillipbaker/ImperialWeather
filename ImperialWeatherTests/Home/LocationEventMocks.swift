//
//  LocationEventMocks.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 12/07/2024.
//

import CoreLocation
@testable import ImperialWeather

extension LocationEvent {
    static let didUpdateLocation =  LocationEvent.didUpdateLocations(
        CLLocation(latitude: 0.0, longitude: 0.0)
    )
    
    static let failedWithError = LocationEvent.didFailWithError(
        LocationError.coordinateError
    )
    
    static let didChangAuthorizationDenied = LocationEvent.didChangeAuthorization(.denied)
    static let didChangAuthorizationRestricted = LocationEvent.didChangeAuthorization(.restricted)
    static let didChangAuthorizationAlways = LocationEvent.didChangeAuthorization(.authorizedAlways)
    static let didChangAuthorizationNotDetermined = LocationEvent.didChangeAuthorization(.notDetermined)
    static let didChangAuthorizationWhenInUse = LocationEvent.didChangeAuthorization(.authorizedWhenInUse)
}
