//
//  MockRequest.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 12/07/2024.
//

import Foundation
@testable import ImperialWeather

struct MockRequest: Hashable {
    let url: URL
    let statusCode: Int
    let data: Data?

    var response: HTTPURLResponse? {
        return HTTPURLResponse(
            url: url,
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )
    }
}

extension MockRequest {
    static let success = MockRequest(
        url: CurrentWeatherResource.validResourceMock().url!,
        statusCode: 200,
        data: try? .validCurrentWeatherDataMock()
    )

    static let failure = MockRequest(
        url: UpcomingWeatherResource.validResourceMock().url!,
        statusCode: 404,
        data: try? .validUpcomingWeatherDataMock()
    )
}
