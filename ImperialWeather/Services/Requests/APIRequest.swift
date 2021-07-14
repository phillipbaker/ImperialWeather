//
//  APIRequest.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

class APIRequest<Resource: APIResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension APIRequest: NetworkRequest {
    func decode(_ data: Data, withCompletion completion: @escaping (Result<(Resource.ModelType?), WeatherError>) -> Void) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        do {
            let value = try decoder.decode(Resource.ModelType.self, from: data)
            completion(.success(value))
        } catch {
            completion(.failure(.invalidData))
        }
    }
    
    func execute(withCompletion completion: @escaping (Result<(Resource.ModelType?),WeatherError>) -> Void) {
        load(resource.url, withCompletion: completion)
    }
}
