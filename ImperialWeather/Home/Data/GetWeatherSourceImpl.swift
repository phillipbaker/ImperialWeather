//
//  GetWeatherSourceImpl.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/26/23.
//

import Foundation

final class GetWeatherSourceImpl: GetWeatherSource, Sendable {
    let locationDataSourceLocal: LocationDataSourceLocal
    let weatherDataSourceRemote: WeatherDataSourceRemote
    
    init(
        locationDataSourceLocal: LocationDataSourceLocal,
        weatherDataSourceRemote: WeatherDataSourceRemote
    ) {
        self.locationDataSourceLocal = locationDataSourceLocal
        self.weatherDataSourceRemote = weatherDataSourceRemote
    }
    
    func weather(forLatitude latitude: String, andLongitude longitude: String) async throws -> HomeWeatherLocationPlain {
        async let locationName = locationDataSourceLocal.locationName(fromLatitude: latitude, andLongitude: longitude)
        async let weather = weatherDataSourceRemote.fetchWeather(latitude: latitude, longitude: longitude)
        
        return try await HomeWeatherLocationPlain(location: locationName, weather: weather)
    }
}
