//
//  LocationPermissionScreen.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/8/21.
//

import SwiftUI

struct LocationPermissionScreen: View {
    var body: some View {
        ErrorView(
            errorImage: ErrorMessage.badLocationImage,
            errorTitle: ErrorMessage.locationPermissionTitle,
            errorDescription: ErrorMessage.locationPermissionDescription,
            buttonTitle: ErrorMessage.loactionPermissionButtonTitle,
            buttonAction: HelperFunctions.launchAppSettings
        )
    }
}

struct PermissionView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            LocationPermissionScreen()
        }
    }
}
