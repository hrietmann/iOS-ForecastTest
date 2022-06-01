//
//  ForecastItem.swift
//  App
//
//

import Foundation

struct ForecastItem {
    
    let day: String
    let description: String
    let type: String
    
}

typealias ForecastItems = [ForecastItem]



extension ForecastItem: Equatable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(day)
        hasher.combine(description)
    }
    static func == (lhs: Self, rhs: Self) -> Bool {
        guard lhs.day == rhs.day else { return false }
        return lhs.description == rhs.description
    }
}



extension ForecastItem {
    
    static var dummy: Self = .init(day: "24", description: "A beautiful summer day", type: "sunny")
    
}


extension ForecastItems {
    
    static var dummies: Self = [
        .init(day: "1", description: "Cloudy out here", type: "cloud"),
        .init(day: "2", description: "Zeus is not happy", type: "lightning"),
        .init(day: "3", description: "Sun is winking", type: "overcast"),
        .init(day: "4", description: "Rain", type: "rain"),
        .init(day: "5", description: "Showers", type: "showers"),
        .init(day: "6", description: "Sunny", type: "sunny"),
        .init(day: "7", description: "Windy", type: "windy")
    ]
    
}
