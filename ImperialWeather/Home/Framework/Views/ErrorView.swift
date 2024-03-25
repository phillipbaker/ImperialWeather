//
//  ErrorView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/23/21.
//

import SwiftUI

struct ErrorView: View {
    let error: NetworkError
    
    var body: some View {
        ZStack {
            Color.classicBackground
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                ScrollView {
                    ZStack {
                        VStack(spacing: 24) {
                            VStack(spacing: 12) {
                                Image(systemName: error.message.image)
                                    .font(.system(size: 50))
                                    .foregroundColor(.secondary)
                                
                                Text(error.message.title)
                                    .padding(.horizontal, 24)
                                    .multilineTextAlignment(.center)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text(error.message.description)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                            }
                            
                            Button {
                                Task { await error.message.buttonAction() }
                            } label: {
                                Text(error.message.buttonTitle)
                                    .frame(maxWidth: .infinity)
                                    .padding(4)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                            }
                            .buttonStyle(.borderedProminent)
                            .padding(.bottom)
                        }
                        .frame(maxWidth: 600)
                        .paneBackground()
                        .padding()
                    }
                    .frame(maxWidth: geometry.size.width, minHeight: geometry.size.height)
                }
            }
        }
    }
}

#Preview {
    ErrorView(error: .locationPermission)
}
