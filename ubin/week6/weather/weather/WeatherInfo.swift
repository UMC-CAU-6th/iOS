//
//  Weather.swift
//  weather
//
//  Created by 황유빈 on 5/23/24.
//

import Foundation

struct WeatherInfo: Decodable {
    let weather: [Weather] ///구조체 배열 -> 날씨와 관련된 여러 정보 포함
    let main: Main ///날씨 응답 데이터에서 main 구조체 -> 기온 관련 정보
    let name: String ///지역명

}

struct Main : Decodable{
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let wind_speed: Double
    let clouds: Int
    let weather: [Weather]
}

struct Weather: Decodable {
    let main: String
    let description: String
    let icon: String
}
