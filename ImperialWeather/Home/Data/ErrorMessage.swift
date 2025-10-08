//
//  ErrorMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/29/22.
//

import Foundation

protocol ErrorMessage: Sendable {
    var image: String { get }
    var title: String { get }
    var description: String { get }
    var buttonTitle: String { get }
    var buttonAction: () async -> Void { get }
}
