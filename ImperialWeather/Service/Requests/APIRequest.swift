//
//  APIRequest.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/30/22.
//

import Foundation

class APIRequest<Resource: APIResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension APIRequest: NetworkRequest {
    func decode(_ data: Data) throws -> Resource.ModelType? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let result = try? decoder.decode(ModelType.self, from: data) else {
            throw NetworkingError.invalidData
        }
        
        return result
    }
    
    func execute() async throws -> Resource.ModelType? {
        guard let url = resource.url else {
            throw NetworkingError.invalidUrl
        }
        
        return try await load(url)
    }
}
