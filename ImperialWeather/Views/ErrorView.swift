//
//  ErrorView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/23/21.
//

import SwiftUI

enum WeatherError: Error {
    case badLocation
    case networkError
}

struct ErrorView: View {
    let error: WeatherError
    
    var body: some View {
        switch error {
        case .badLocation:
            Text("The location was bad.")
        case .networkError:
            Text("There was a network error.")
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: .networkError)
    }
}
