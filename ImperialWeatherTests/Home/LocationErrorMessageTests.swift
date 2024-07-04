//
//  LocationErrorMessageTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

@testable import ImperialWeather
import Testing

struct LocationErrorMessageTests {
    @Test func locationPermissionMessage() async {
        let message = LocationPermissionMessage()
        #expect(message.image == ErrorSymbol.locationError)
        #expect(message.title == ErrorTitle.locationPermission)
        #expect(message.description == ErrorDescription.locationPermission)
        #expect(message.buttonTitle == ErrorButtonTitle.locationServices)
        #expect(await message.buttonAction() == Application.live.launchAppSettings())
    }
    
    @Test func locationErrorMessage() async {
        let message = LocationErrorMessage()
        #expect(message.image == ErrorSymbol.locationError)
        #expect(message.title == ErrorTitle.locationError)
        #expect(message.description == ErrorDescription.locationError)
        #expect(message.buttonTitle == ErrorButtonTitle.locationPermission)
        #expect(await message.buttonAction() == Application.live.launchAppSettings())
    }
}
