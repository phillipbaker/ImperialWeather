//
//  GetWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/30/22.
//

import Foundation

final class GetWeather: Sendable {
    let source: GetWeatherSource

    init(source: GetWeatherSource) {
        self.source = source
    }

    func weather() async throws -> HomeWeather {
        HomeWeather.mapHomeWeatherFromData(data: try await source.weather())
    }
}
