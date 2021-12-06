//
//  ErrorView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/14/21.
//

import SwiftUI

struct ErrorView: View {
    var errorImage: String
    var errorTitle: String
    var errorDescription: String
    var buttonTitle: String
    var buttonAction: () -> ()
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 16) {
                Image(systemName: errorImage)
                    .font(.system(size: 72))
                
                VStack(spacing: 8) {
                    Text(errorTitle)
                        .font(.headline)
                    Text(errorDescription)
                        .foregroundColor(.secondary)
                }
            }
            .paneBackground()
            
            Button(buttonTitle) {
                buttonAction()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding(.horizontal)
        .paneShadow()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            ErrorView(
                errorImage: ErrorMessage.networkErrorImage,
                errorTitle: ErrorMessage.networkErrorTitle,
                errorDescription: ErrorMessage.networkErrorDescription,
                buttonTitle: ErrorMessage.networkErrorButtonTitle,
                buttonAction: {}
            )
        }
    }
}
