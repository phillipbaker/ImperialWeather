//
//  APIResource.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

protocol APIResource {
    associatedtype ModelType: Decodable
    var path: String { get }
    var latitude: String { get }
    var longitude: String { get }
    var queryItems: [(String, String?)]? { get }
}

extension APIResource {
    
    var scheme: String { "https" }
    var host: String { "api.openweathermap.org" }
    
    var url: URL? {
        var components = URLComponents()
        
        components.scheme = scheme
        components.host = host
        components.path = path
        
        components.queryItems = [
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: "5378ee83a13bdf24c6d0fe970cd52038"),
            URLQueryItem(name: "lat", value: latitude),
            URLQueryItem(name: "lon", value: longitude)
        ]
        
        if let resourceItems = resourceQueryItems {
            components.queryItems?.append(contentsOf: resourceItems)
        }

        return components.url
    }
    
    var resourceQueryItems: [URLQueryItem]? {
        var resourceQueryItems = [URLQueryItem]()
        if let unwrappedItems = queryItems {
            for (name, value) in unwrappedItems where value != nil {
                let queryItem = URLQueryItem(name: name, value: value)
                resourceQueryItems.append(queryItem)
            }
        }
        
        return resourceQueryItems
    }
}
