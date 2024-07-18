//
//  APIClient.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/07/2024.
//

import Foundation

protocol APIClientProtocol: Sendable {
    func data(from url: URL) async throws -> Data
}

final class APIClient: APIClientProtocol {
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func data(from url: URL) async throws -> Data {
        let request = URLRequest(url: url)
        let (data, response) = try await urlSession.data(for: request)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }

        return data
    }
}
