//
//  LocationService.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 26/06/2024.
//

import Foundation

protocol LocationService: Sendable {
    func fetchLocation() async throws -> (latitude: String, longitude: String)
    func fetchPlaceName(for latitude: String, and longitude: String) async throws -> String
}
