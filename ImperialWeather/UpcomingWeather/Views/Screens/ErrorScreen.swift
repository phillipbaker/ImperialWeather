//
//  ErrorScreen.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/23/21.
//

import SwiftUI

struct ErrorScreen: View {
    let error: WeatherError
    
    var body: some View {
        switch error {
        case .badLocation:
            ErrorView(
                errorImage: ErrorMessage.badLocationImage,
                errorTitle: ErrorMessage.badLocationTitle,
                errorDescription: ErrorMessage.badLocationDescription,
                buttonTitle: ErrorMessage.badLocationButtonTitle,
                buttonAction: ButtonActions.launchAppSettings
            )
        case .networkError:
            ErrorView(
                errorImage: ErrorMessage.networkErrorImage,
                errorTitle: ErrorMessage.networkErrorTitle,
                errorDescription: ErrorMessage.networkErrorDescription,
                buttonTitle: ErrorMessage.networkErrorButtonTitle,
                buttonAction: ButtonActions.launchAppSettings
            )
        case .invalidResponse:
            ErrorView(
                errorImage: ErrorMessage.invalidDataOrResponseImage,
                errorTitle: ErrorMessage.invalidResponseTitle,
                errorDescription: ErrorMessage.invalidResponseDescription,
                buttonTitle: ErrorMessage.invalidResponseButtonTitle,
                buttonAction: ButtonActions.submitFeeback
            )
        case .invalidData:
            ErrorView(
                errorImage: ErrorMessage.invalidDataOrResponseImage,
                errorTitle: ErrorMessage.invalidDataTitle,
                errorDescription: ErrorMessage.invalidDataDescription,
                buttonTitle: ErrorMessage.invalidDataButtonTitle,
                buttonAction: ButtonActions.submitFeeback
            )
        }
    }
}

struct ErrorScreen_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            ErrorScreen(error: .networkError)
        }
    }
}
