//
//  ErrorView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/14/21.
//

import SwiftUI

struct ErrorMessageView: View {
    var image: String
    var title: String
    var description: String
    var buttonTitle: String
    var buttonAction: () -> ()
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: image)
                .font(.system(size: 72))
            
            VStack(spacing: 8) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .foregroundColor(.secondary)
            }
            .multilineTextAlignment(.center)
            
            Button(buttonTitle) {
                buttonAction()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .paneBackground()
        .paneShadow()
        .padding(.horizontal)
        
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            ErrorMessageView(
                image: ErrorMessage.locationErrorImage,
                title: ErrorMessage.locationErrorTitle,
                description: ErrorMessage.locationErrorDescription,
                buttonTitle: ErrorMessage.locationErrorButtonTitle,
                buttonAction: {}
            )
        }
        
        ZStack {
            BackgroundView()
            ErrorMessageView(
                image: ErrorMessage.locationErrorImage,
                title: ErrorMessage.locationPermissionTitle,
                description: ErrorMessage.locationPermissionDescription,
                buttonTitle: ErrorMessage.locationPermissionButtonTitle,
                buttonAction: {}
            )
        }
    }
}
