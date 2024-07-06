//
//  HomeStateTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 06/07/2024.
//

@testable import ImperialWeather
import Testing

struct HomeStateTests {
    @Test func successEquality() {
        let lhs = HomeState.success(HomeWeather.mock)
        let rhs = HomeState.success(HomeWeather.mock)
        #expect(lhs == rhs)
    }
    
    @Test func successInequality() {
        let lhs = HomeState.success(HomeWeather.mock)
        let rhs = HomeState.success(HomeWeather(current: CurrentWeather.nilLocationMock, hourly: .mock, daily: .mock))
        #expect(lhs != rhs)
    }
    
    @Test func locationErrorEquality() {
        let lhs = HomeState.error(LocationError.coordinateError)
        let rhs = HomeState.error(LocationError.coordinateError)
        #expect(lhs == rhs)
    }
    
    @Test func locationErrorInequality() {
        let lhs = HomeState.error(LocationError.coordinateError)
        let rhs = HomeState.error(LocationError.permissionError)
        #expect(lhs != rhs)
    }
    
    @Test func networkErrorEquality() {
        let lhs = HomeState.error(NetworkError.invalidResponse)
        let rhs = HomeState.error(NetworkError.invalidResponse)
        #expect(lhs == rhs)
    }
    
    @Test func networkErrorInequality() {
        let lhs = HomeState.error(NetworkError.invalidUrl)
        let rhs = HomeState.error(NetworkError.networkError)
        #expect(lhs != rhs)
    }
    
    @Test func defaultCaseInequality() {
        let lhs = HomeState.success(HomeWeather.mock)
        let rhs = HomeState.error(NetworkError.invalidData)
        #expect(lhs != rhs)
    }
}
