//
//  ViewController.swift
//  weather
//
//  Created by 황유빈 on 5/23/24.
//

//WeatherViewController.swift

import Foundation
import UIKit
import SnapKit
import Alamofire

class WeatherViewController: UIViewController {
    
    //MARK: - UI
    private lazy var country: UILabel = {
        let country = UILabel()
        country.text = ""
        country.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        country.layer.borderColor = UIColor.black.cgColor
        country.layer.borderWidth = 1
        return country
    }()
    
    private lazy var icon: UIImageView = {
        let icon = UIImageView()
        return icon
    }()
    
    private let weather: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return lb
    }()
    
    private lazy var temp: UILabel = {
        let temp = UILabel()
        temp.text = ""
        temp.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return temp
    }()
    
    private lazy var minmaxtemp: UILabel = {
        let temp = UILabel()
        temp.text = ""
        temp.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return temp
    }()
    
    //MARK: - Stack
    private lazy var weatherStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.isHidden = true
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        view.addSubview(country)
        view.addSubview(weatherStack)
        weatherStack.addArrangedSubview(country)
        weatherStack.addArrangedSubview(icon)
        weatherStack.addArrangedSubview(weather)
        weatherStack.addArrangedSubview(temp)
        weatherStack.addArrangedSubview(minmaxtemp)
        makeConstraints()
    }
    
    //MARK: - Constraints
    private func makeConstraints() {
        weatherStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        country.snp.makeConstraints { make in
            make.top.equalTo(weatherStack.snp.top)
        }
        icon.snp.makeConstraints { make in
            make.top.equalTo(country.snp.bottom).offset(20)
            make.height.lessThanOrEqualTo(120)
            make.width.lessThanOrEqualTo(120)
        }
        weather.snp.makeConstraints { make in
            make.top.equalTo(icon.snp.bottom).offset(20)
        }
        temp.snp.makeConstraints { make in
            make.top.equalTo(weather.snp.bottom).offset(20)
        }
        minmaxtemp.snp.makeConstraints { make in
            make.top.equalTo(temp.snp.bottom).offset(20)
        }
    }
    
    //MARK: - Functions
    func getCurrentWeahterByAlamofire(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=c914009ae538c859e071c088574cefba") else { return }
        
        AF.request(url, method: .get, parameters: [:])
            .responseData(completionHandler: { response in
                let decoder = JSONDecoder()
                switch response.result {
                case let .success(data):
                    do {
                        let weatherInfo = try decoder.decode(WeatherInfo.self, from: data)
                        DispatchQueue.main.async {
                            self.weatherStack.isHidden = false
                            self.configureView(weatherInfo: weatherInfo)
                        }
                        print(weatherInfo)
                    } catch {
                        debugPrint(error)
                    }
                case let .failure(error):
                    debugPrint(error)
                }
            })
    }

    private func configureView(weatherInfo: WeatherInfo){
        self.country.text = weatherInfo.name
        if let weather = weatherInfo.weather.first{
            self.weather.text = weather.main
            let icon = weather.icon
            let iconname = mapIconCodeToSystemName(icon)
            self.icon.image = UIImage(systemName: iconname)
        }
        let temp = Int(weatherInfo.main.temp-273.15)
        let maxtemp = Int(weatherInfo.main.temp_max-273.15)
        let mintemp = Int(weatherInfo.main.temp_min-273.15)
        self.temp.text = "\(temp)°"
        self.minmaxtemp.text = "최고 : \(maxtemp)°, 최저 : \(mintemp)°"
    }
    
    ///icon
    private func mapIconCodeToSystemName(_ iconCode: String) -> String {
        switch iconCode {
            case "01d": return "sun.max"
            case "02d": return "cloud.sun"
            case "03d": return "cloud"
            case "04d": return "smoke"
            case "09d": return "cloud.drizzle"
            case "10d": return "cloud.sun.rain"
            case "11d": return "cloud.bolt"
            case "13d": return "snowflake"
            case "50d": return "cloud.fog"
            case "01n": return "moon.stars"
            case "02n": return "cloud.moon"
            case "03n": return "cloud"
            case "04n": return "smoke"
            case "09n": return "cloud.drizzle"
            case "10n": return "cloud.moon.rain"
            case "11n": return "cloud.bolt"
            case "13n": return "snowflake"
            case "50n": return "cloud.fog"
            default: return "questionmark"
        }
    }
}
