//
//  LocationDataSourceLocal.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/29/23.
//

import Foundation

protocol LocationDataSourceLocal {
    func locationName(fromLatitude latitude: String, andLongitude longitude: String) async throws -> String
}
