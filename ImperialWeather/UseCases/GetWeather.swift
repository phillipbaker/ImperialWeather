//
//  GetWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/30/22.
//

import Foundation

class GetWeather {        
    func weather(latitude: String, longitude: String) async throws -> HomeWeather {
        let currentWeatherResource = CurrentWeatherResource(latitude: latitude, longitude: longitude)
        let currentRequest = APIRequest(resource: currentWeatherResource)
        
        let upcomingWeatherResource = UpcomingWeatherResource(latitude: latitude, longitude: longitude)
        let upcomingRequest = APIRequest(resource: upcomingWeatherResource)
        
        guard let currentWeather = try await currentRequest.execute()?.mapToPlain() else {
            throw NetworkingError.invalidData
        }
        
        guard let upcomingWeather = try await upcomingRequest.execute()?.mapToPlain() else {
            throw NetworkingError.invalidData
        }
        
        let homeWeatherPlain = HomeWeatherPlain(
            current: currentWeather,
            hourly: upcomingWeather.hourly,
            daily: upcomingWeather.daily)
        
        return HomeWeather.mapHomeWeatherFromData(data: homeWeatherPlain)
    }
}
