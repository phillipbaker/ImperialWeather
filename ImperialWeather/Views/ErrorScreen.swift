//
//  ErrorScreen.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/23/21.
//

import SwiftUI

struct ErrorScreen: View {
    let error: APIError
    
    var body: some View {
        switch error {
        case .locationError:
            ErrorMessageView(
                image: ErrorMessage.locationErrorImage,
                title: ErrorMessage.locationErrorTitle,
                description: ErrorMessage.locationErrorDescription,
                buttonTitle: ErrorMessage.locationErrorButtonTitle,
                buttonAction: ButtonAction.launchAppSettings
            )
        case .networkError:
            ErrorMessageView(
                image: ErrorMessage.networkErrorImage,
                title: ErrorMessage.networkErrorTitle,
                description: ErrorMessage.networkErrorDescription,
                buttonTitle: ErrorMessage.networkErrorButtonTitle,
                buttonAction: ButtonAction.launchAppSettings
            )
        case .invalidResponse:
            ErrorMessageView(
                image: ErrorMessage.invalidDataOrResponseImage,
                title: ErrorMessage.invalidResponseTitle,
                description: ErrorMessage.invalidResponseDescription,
                buttonTitle: ErrorMessage.invalidResponseButtonTitle,
                buttonAction: ButtonAction.submitFeeback
            )
        case .invalidData:
            ErrorMessageView(
                image: ErrorMessage.invalidDataOrResponseImage,
                title: ErrorMessage.invalidDataTitle,
                description: ErrorMessage.invalidDataDescription,
                buttonTitle: ErrorMessage.invalidDataButtonTitle,
                buttonAction: ButtonAction.submitFeeback
            )
        case .locationPermission:
            ErrorMessageView(
                image: ErrorMessage.locationErrorImage,
                title: ErrorMessage.locationPermissionTitle,
                description: ErrorMessage.locationPermissionDescription,
                buttonTitle: ErrorMessage.locationPermissionButtonTitle,
                buttonAction: ButtonAction.launchAppSettings
            )
        }
    }
}

struct ErrorScreen_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            ErrorScreen(error: .locationError)
        }
        
        ZStack {
            BackgroundView()
            ErrorScreen(error: .networkError)
        }
        
        ZStack {
            BackgroundView()
            ErrorScreen(error: .invalidResponse)
        }
        
        ZStack {
            BackgroundView()
            ErrorScreen(error: .invalidData)
        }
        
        ZStack {
            BackgroundView()
            ErrorScreen(error: .locationPermission)
        }
    }
}
