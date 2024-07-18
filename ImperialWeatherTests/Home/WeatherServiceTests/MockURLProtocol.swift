//
//  MockURLProtocol.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/07/2024.
//

import Foundation
@testable import ImperialWeather
import Testing

final class MockURLProtocol: URLProtocol {
    enum MockRequestError: Error {
        case invalidData
        case invalidResponse
        case requestNotFound
    }

    static var mockRequests: Set<MockRequest> = [.success, .failure]

    override static func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override static func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        let foundRequest = Self.mockRequests.first { [unowned self] mockRequest in
            self.request.url?.path == mockRequest.url.path
        }

        guard let request = foundRequest else {
            client?.urlProtocol(self, didFailWithError: MockRequestError.requestNotFound)
            return
        }

        guard let data = request.data else {
            client?.urlProtocol(self, didFailWithError: MockRequestError.invalidData)
            return
        }

        client?.urlProtocol(self, didLoad: data)

        guard let response = request.response else {
            client?.urlProtocol(self, didFailWithError: MockRequestError.invalidResponse)
            return
        }

        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
