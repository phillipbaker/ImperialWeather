//
//  ErrorView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/23/21.
//

import SwiftUI

struct ErrorView: View {
    let error: WeatherError

    var body: some View {
        ZStack {
            Color.weatherBackground
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 16) {
                switch error {
                case .badLocation:
                    Image(systemName: "location.slash")
                        .font(.system(size: 128))
                    Text("Unable to Establish Your Location")
                        .font(.headline)
                case .networkError:
                    Image(systemName: "wifi.exclamationmark")
                        .font(.system(size: 128))
                    VStack(spacing: 8) {
                        Text("You Are Not Connected to the Internet")
                            .font(.headline)
                        Text("The weather can’t be displayed because your device is currently offline.")
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                case .invalidResponse:
                    Image(systemName: "xmark.octagon")
                        .font(.system(size: 128))
                    Text("Invalid Response")
                        .font(.title2)
                case .invalidData:
                    Image(systemName: "xmark.octagon")
                        .font(.system(size: 128))
                    Text("Invalid Data")
                        .font(.title2)
                }
            }
            .paneBackground()
            .padding(.horizontal)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: .networkError)
    }
}
