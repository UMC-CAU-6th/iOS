//
//  weatherInfo.swift
//  weatherApp
//
//  Created by 김나연 on 5/22/24.
//

import Foundation

struct WeatherInformation: Decodable {
    let main: Main
    let weather: [Weather]
    let name: String
    
    struct Main: Decodable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
    }
    
    struct Weather: Decodable {
        let main: String
        let icon: String
    }
}

