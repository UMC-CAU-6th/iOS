//
//  File.swift
//  weatherApp
//
//  Created by 김나연 on 5/23/24.
//

import Foundation
import Moya

enum WeatherAPI {
    case getWeather
}
extension WeatherAPI: TargetType{
    var baseURL: URL{
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?id=1835848&appid=0fc711f2f6190bd5ba5aed17e803d5bf")!
    }
    var path: String{
        switch self{
        case .getWeather:
            return ""
        }
    }
    var method: Moya.Method{
        switch self{
        case .getWeather:
            return .get
        }
    }
    var sampleData: Data{
        return Data()
    }
    var task: Task{
        switch self{
        case .getWeather:
            return .requestPlain
        }
    }
    var headers: [String : String]?{
        return ["Content-type": "application/json"]
    }
}
