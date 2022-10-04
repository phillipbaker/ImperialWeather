//
//  NetworkRequest.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/30/22.
//

import Foundation

protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) throws -> ModelType?
    func execute() async throws -> ModelType?
}

extension NetworkRequest {
    func load(_ url: URL) async throws -> ModelType? {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }

        return try self.decode(data)
    }
}
