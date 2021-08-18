//
//  WeatherData.swift
//  Clima
//
//  Created by Jervy Umandap on 8/17/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation


struct WeatherData: Codable {
    let name: String
    let coord: Coordinate
    let weather: [Weather]
    let main: Main
}

struct Coordinate: Codable {
    let lon: Double
    let lat: Double
}
struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    let sea_level: Int?
    let grnd_level: Int?
}

//struct APIResponse: Codable {
//    let coord: Coordinate
//    let weather: [Weather]
//    let base: String
//    let main: Main
//    let visibility: Int
//    let wind: Wind
//
//    let clouds: Cloud
//
//    let dt: Int
//    let sys: Sys
//
//    let timezone: Int
//    let id: Int
//    let name: String
//    let cod: Int
//}
//
//struct Coordinate: Codable {
//    let lon: Double
//    let lat: Double
//}
//
//struct Weather: Codable {
//    let id: Int
//    let main: String
//    let description: String
//}
//
//struct Main: Codable {
//    let temp: Int
//    let feels_like: Int
//    let temp_min: Int
//    let temp_max: Int
//    let pressure: Int
//    let humidity: Int
//}
//
//struct Wind: Codable {
//    let speed: Double
//    let deg: Int
//}
//
//struct Cloud: Codable {
//    let all: Int
//}
//
//struct Sys: Codable {
//    let type: Int
//    let id: Int
//    let country: String
//    let sunrise: Int
//    let sunset: Int
//}
//
