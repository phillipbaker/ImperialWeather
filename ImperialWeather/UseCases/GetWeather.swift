//
//  GetWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/30/22.
//

import Foundation

class GetWeather {        
    func weather(lat: String, lon: String) async throws -> HomeWeather {
        
        let currentWeatherResource = CurrentWeatherResource(latitude: lat, longitude: lon)
        let currentRequest = APIRequest(resource: currentWeatherResource)
        
        let upcomingWeatherResource = UpcomingWeatherResource(latitude: lat, longitude: lon)
        let upcomingRequest = APIRequest(resource: upcomingWeatherResource)
        
        do {
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
            
        } catch {
            throw NetworkingError.invalidData
        }
    }
}
