//
//  GetWeatherSourceImpl.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/26/23.
//

import Foundation

final class GetWeatherSourceImpl: GetWeatherSource {
    let locationDataSourceLocal: LocationDataSourceLocal
    let weatherDataSourceRemote: WeatherDataSourceRemote
    
    init(
        locationDataSourceLocal: LocationDataSourceLocal,
        weatherDataSourceRemote: WeatherDataSourceRemote
    ) {
        self.locationDataSourceLocal = locationDataSourceLocal
        self.weatherDataSourceRemote = weatherDataSourceRemote
    }
    
    func weather() async throws -> HomeWeatherLocationPlain {
        let location = try await locationDataSourceLocal.fetchLocation()
        async let locationName = locationDataSourceLocal.locationName(for: location.latitude, and: location.longitude)
        async let weather = weatherDataSourceRemote.fetchWeather(for: location.latitude, and: location.longitude)
        return try await HomeWeatherLocationPlain(location: locationName, weather: weather)
    }
}
