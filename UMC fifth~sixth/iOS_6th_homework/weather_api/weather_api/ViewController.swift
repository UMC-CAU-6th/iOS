//
//  ViewController.swift
//  weather_api
//
//  Created by 한지강 on 5/20/24.
//
import SnapKit
import UIKit
import Alamofire
import Moya

class ViewController: UIViewController {
    
    //MARK: - 프로퍼티
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "버튼을 눌러 날씨를 확인하세요"
        return label
    }()
    
    private lazy var alamofireBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Alamofire", for: .normal)
        button.addTarget(self, action: #selector(Alamofire), for: .touchUpInside)
        return button
    }()
    
    private lazy var moyaBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Moya", for: .normal)
        button.addTarget(self, action: #selector(Moya), for: .touchUpInside)
        return button
    }()
    
    let provider = MoyaProvider<WeatherService>()

 
    //MARK: - autolayout
    private func makeConstraints() {
        view.addSubview(weatherLabel)
        weatherLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        view.addSubview(alamofireBtn)
        alamofireBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(weatherLabel.snp.bottom).offset(20)
        }
        
        view.addSubview(moyaBtn)
        moyaBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(alamofireBtn.snp.bottom).offset(20)
        }
    }

    //MARK: - 버튼
    @objc func Alamofire() {
        fetchWeatherWithAlamofire()
    }

    @objc func Moya() {
        fetchWeatherWithMoya()
    }

    private func fetchWeatherWithAlamofire() {
        let apiKey = "7fe3b99f344add008e40118bc62c4ed9"
        let city = "Seoul"
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"

        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any] {
                    self.parseWeatherData(json: json)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    //Weak self 참고하기 result앞에 
    private func fetchWeatherWithMoya() {
        provider.request(.getWeather(city: "Seoul")) { result in
            switch result {
            case .success(let response):
                do {
                    if let json = try response.mapJSON() as? [String: Any] {
                        self.parseWeatherData(json: json)
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    
    //struct사용해서 재사용가능하도록
    private func parseWeatherData(json: [String: Any]) {
        if let main = json["main"] as? [String: Any],
           let temp = main["temp"] as? Double,
           let feelsLike = main["feels_like"] as? Double,
           let tempMin = main["temp_min"] as? Double,
           let tempMax = main["temp_max"] as? Double,
           let pressure = main["pressure"] as? Int,
           let humidity = main["humidity"] as? Int {
            
            DispatchQueue.main.async {
                self.weatherLabel.text = """
                Temp: \(temp)°C
                Feels Like: \(feelsLike)°C
                Temp Min: \(tempMin)°C
                Temp Max: \(tempMax)°C
                Pressure: \(pressure) hPa
                Humidity: \(humidity)%
                """
            }
        }
    }
    
    //MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeConstraints()
    }
    
}

enum WeatherService: TargetType {
    case getWeather(city: String)

    var baseURL: URL { return URL(string: "https://api.openweathermap.org/data/2.5")! }
    var path: String {
        switch self {
        case .getWeather:
            return "/weather"
        }
    }
    var method: Moya.Method {
        return .get
    }
    var task: Task {
        switch self {
        case .getWeather(let city):
            return .requestParameters(parameters: ["q": city, "appid": "7fe3b99f344add008e40118bc62c4ed9", "units": "metric"], encoding: URLEncoding.queryString)
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    var sampleData: Data {
        return Data()
    }
}

