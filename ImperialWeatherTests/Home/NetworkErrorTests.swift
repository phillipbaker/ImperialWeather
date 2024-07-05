//
//  NetworkErrorTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 05/07/2024.
//

@testable import ImperialWeather
import Testing

struct NetworkErrorTests {
    @Test func invalidUrl() {
        let error = NetworkError.invalidUrl
        #expect(error.message is InvalidURLMessage)
    }
    
    @Test func networkError() {
        let error = NetworkError.networkError
        #expect(error.message is NetworkErrorMessage)
    }
    
    @Test func invalidResponse() {
        let error = NetworkError.invalidResponse
        #expect(error.message is InvalidResponseMessage)
    }
    
    @Test func invalidData() {
        let error = NetworkError.invalidData
        #expect(error.message is InvalidDataMessage)
    }
}
