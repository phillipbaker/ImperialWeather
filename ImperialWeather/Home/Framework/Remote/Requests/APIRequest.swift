//
//  APIRequest.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/30/22.
//

import Foundation

final class APIRequest<Resource: APIResource>: Sendable where Resource: Sendable {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
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
        
        return try await load(url)
    }
}
