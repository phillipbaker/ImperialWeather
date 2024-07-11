//
//  NetworkRequest.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/30/22.
//

import Foundation

protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) throws -> ModelType
    func execute() async throws -> ModelType
}
