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
                    Text("Unable to establish your location.")
                        .font(.title)
                case .networkError:
                    Image(systemName: "wifi.exclamationmark")
                        .font(.system(size: 128))
                    Text("There was a network error.")
                        .font(.title)
                case .invalidResponse:
                    Image(systemName: "xmark.octagon")
                        .font(.system(size: 128))
                    Text("Invalid Response")
                        .font(.title)
                case .invalidData:
                    Image(systemName: "xmark.octagon")
                        .font(.system(size: 128))
                    Text("Invalid Data")
                        .font(.title)
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: .networkError)
    }
}
