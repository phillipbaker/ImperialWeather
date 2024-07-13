//
//  LocationDataSourceLocal.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/29/23.
//

import Foundation

protocol LocationDataSourceLocal: Sendable {
    func fetchLocation() async throws -> LocationPlain
}
