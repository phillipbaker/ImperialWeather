//
//  LocationEvent.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 12/07/2024.
//

import CoreLocation

enum LocationEvent {
    case didChangeAuthorization(CLAuthorizationStatus)
    case didUpdateLocations(CLLocation)
    case didFailWithError(Error)
}
