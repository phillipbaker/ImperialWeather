//
//  GetWeatherSourceImpl.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/26/23.
//

import Foundation

class GetWeatherSourceImpl: GetWeatherSource {
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
        let locationName = try await locationDataSourceLocal.locationName(fromLatitude: latitude, andLongitude: longitude)
        let weather = try await weatherDataSourceRemote.fetchWeather(latitude: latitude, longitude: longitude)
        
        return HomeWeatherLocationPlain(location: locationName, weather: weather)
    }
}
