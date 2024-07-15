//
//  LocationEvent.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 12/07/2024.
//

import CoreLocation

enum LocationUpdate {
    case didUpdateLocation(CLLocation)
    case didFailWithError(LocationError)
}
