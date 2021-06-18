//
//  PrimaryScalePickerView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import SwiftUI

enum PrimaryScale: Int {
    case celsius
    case fahrenheit
    
    var id: Int { rawValue }
}

struct PrimaryScalePickerView: View {
    @AppStorage("primaryScale") private var primaryScale: PrimaryScale = .celsius
    
    var body: some View {
        Picker("Primary Scale", selection: $primaryScale) {
            Group {
                Text("ºC")
                    .tag(PrimaryScale.celsius)
                Text("ºF")
                    .tag(PrimaryScale.fahrenheit)
            }
        }
        .frame(width: 128)
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct PrimaryScalePickerView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryScalePickerView()
    }
}
