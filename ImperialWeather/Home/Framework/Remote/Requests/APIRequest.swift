//
//  APIRequest.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/30/22.
//

import Foundation

final class APIRequest<Resource: APIResource>: Sendable {
    let resource: Resource
    let apiClient: APIClientProtocol

    init(
        resource: Resource,
        apiClient: APIClientProtocol = APIClient()
    ) {
        self.resource = resource
        self.apiClient = apiClient
    }
}

extension APIRequest: NetworkRequest {
    func decode(_ data: Data) throws -> Resource.ModelType {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let result = try? decoder.decode(ModelType.self, from: data) else {
            throw NetworkError.invalidData
        }

        return result
    }

    func execute() async throws -> Resource.ModelType {
        guard let url = resource.url else {
            throw NetworkError.invalidUrl
        }

        let data = try await apiClient.data(from: url)
        return try decode(data)
    }
}
