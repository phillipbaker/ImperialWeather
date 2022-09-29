//
//  ErrorScreen.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/23/21.
//

import SwiftUI

struct ErrorScreen: View {
    let error: NetworkingError
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 10) {
                Image(systemName: error.message.image)
                    .font(.largeTitle)
                
                Text(error.message.title)
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            
            Text(error.message.description)
                .foregroundColor(.secondary)
            
            Button(error.message.buttonTitle) {
                error.message.buttonAction()
            }
            .buttonStyle(.borderedProminent)
        }
        .paneBackground()
        .padding()
    }
}

struct ErrorScreen_Previews: PreviewProvider {
    static var previews: some View {
        ErrorScreen(error: .networkError)
            .backgroundView()
    }
}
