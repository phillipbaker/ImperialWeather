//
//  ErrorView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/23/21.
//

import SwiftUI

struct ErrorView: View {
    let error: NetworkingError
    
    var body: some View {
        ZStack {
            Color.weatherBackground
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                VStack(spacing: 12) {
                    Image(systemName: error.message.image)
                        .font(.largeTitle)
                        .padding(.vertical)
                    
                    Text(error.message.title)
                        .padding(.horizontal, 24)
                        .multilineTextAlignment(.center)
                        .font(.headline)
                    
                    Text(error.message.description)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                
                Button {
                    error.message.buttonAction()
                } label: {
                    Text(error.message.buttonTitle)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
            }
            .paneBackground()
            .padding()
        }
    }
}

struct ErrorScreen_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 20) {
                ErrorView(error: .locationPermission)
                ErrorView(error: .locationError)
                ErrorView(error: .invalidUrl)
                ErrorView(error: .networkError)
                ErrorView(error: .invalidResponse)
                ErrorView(error: .invalidData)
            }
        }
    }
}
