//
//  WeatherManager.swift
//  Clima
//
//  Created by Jervy Umandap on 8/17/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=3a5bcb0cf9d4b4fd921469551c8b5de9&units=metric" // &q=London
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
//        print(urlString)
    }
    
    var weatherManagerDelegate: WeatherManagerDelegate?
    
    enum APIError: Error {
        case failedToGetData
    }
    
    func performRequest(with urlString: String) {
//        1. Create URL
        if let url = URL(string: urlString) {
            //        2. Create URLSession
            let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                guard let safeData = data, error == nil else {
                    weatherManagerDelegate?.didFailWithError(error: error!)
                    return
                }
                
//                if let weather = parseJSON(weatherData: safeData) {
//                    weatherManagerDelegate?.didUpdateWeather(weather: weather)
//                }
                
                do {
                    let result = try JSONDecoder().decode(WeatherData.self, from: safeData)
                    let weather = WeatherModel(conditionId: result.weather[0].id,
                                               cityName: result.name,
                                               temperature: result.main.temp)
                    
                    weatherManagerDelegate?.didUpdateWeather(self, weather: weather)
                    
                } catch {
                    weatherManagerDelegate?.didFailWithError(error: error)
                    print(error)
                }
                
            })
            task.resume()
            //        3. Give URLSession a task
            //        4. Start the task
            
        }
    }
    
//    func parseJSON(weatherData: Data) -> WeatherModel? {
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
//            let id = decodedData.weather[0].id
//            let temp = decodedData.main.temp
//            let name = decodedData.name
//
//            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
//            return weather
//
//        } catch {
//            return nil
//        }
//    }
    
    
}

