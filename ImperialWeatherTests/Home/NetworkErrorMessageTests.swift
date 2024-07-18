//
//  NetworkErrorMessageTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

@testable import ImperialWeather
import Testing

struct NetworkErrorMessageTests {
    @Test func invalidURLMessage() async {
        let message = InvalidURLMessage()
        #expect(message.image == ErrorSymbol.dataError)
        #expect(message.title == ErrorTitle.invalidURL)
        #expect(message.description == ErrorDescription.invalidURL)
        #expect(message.buttonTitle == ErrorButtonTitle.reportProblem)
        #expect(await message.buttonAction() == Application.live.submitFeedback())
    }

    @Test func networkError() async {
        let message = NetworkErrorMessage()
        #expect(message.image == ErrorSymbol.networkError)
        #expect(message.title == ErrorTitle.networkError)
        #expect(message.description == ErrorDescription.networkError)
        #expect(message.buttonTitle == ErrorButtonTitle.networkError)
        #expect(await message.buttonAction() == Application.live.launchAppSettings())
    }

    @Test func invalidResponseMessage() async {
        let message = InvalidResponseMessage()
        #expect(message.image == ErrorSymbol.dataError)
        #expect(message.title == ErrorTitle.invalidResponse)
        #expect(message.description == ErrorDescription.invalidResponse)
        #expect(message.buttonTitle == ErrorButtonTitle.reportProblem)
        #expect(await message.buttonAction() == Application.live.submitFeedback())
    }

    @Test func invalidDataMessage() async {
        let message = InvalidDataMessage()
        #expect(message.image == ErrorSymbol.dataError)
        #expect(message.title == ErrorTitle.invalidData)
        #expect(message.description == ErrorDescription.invalidData)
        #expect(message.buttonTitle == ErrorButtonTitle.reportProblem)
        #expect(await message.buttonAction() == Application.live.submitFeedback())
    }
}
