//
//  NetworkRequest.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data, withCompletion completion: @escaping (Result<ModelType?, ApiError>) -> Void)
    func execute(withCompletion completion: @escaping (Result<ModelType?, ApiError>) -> Void)
}

extension NetworkRequest {
    func load(_ url: URL, withCompletion completion: @escaping (Result<ModelType?, ApiError>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let _ = error {
                completion(.failure(.networkError))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            self?.decode(data) { result in
                switch result {
                case .success(let value):
                    DispatchQueue.main.async {
                        completion(.success(value))
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
}
