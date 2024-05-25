//
//  ViewController.swift
//  weatherApp
//
//  Created by 김나연 on 5/22/24.
//

import UIKit
import SnapKit
import Alamofire
import Moya

class ViewController: UIViewController {
    //MARK: - UI
    ///UI view
    private lazy var containerBox: CustomView = {
        let v = CustomView()
        v.setConstraints()
        return v
    }()
    ///나라
    private let countryLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return lb
    }()
    ///아이콘
    private let weatherIcon = UIImageView()
    ///날씨
    private let weatherLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return lb
    }()
    ///온도
    private let tempLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont.systemFont(ofSize: 48, weight: .semibold)
        return lb
    }()
    ///최고, 최저 온도
    private let maxmintempLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont.systemFont(ofSize: 16)
        return lb
    }()
    ///버튼
    private lazy var alamofireBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Alamofire", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(tapAlamofire), for: .touchUpInside)
        return btn
    }()
    private lazy var moyaBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Moya", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(tapMoya), for: .touchUpInside)
        return btn
    }()
    ///moya
    private lazy var moyaLabel: UILabel = {
        let m = UILabel()
        m.text = ""
        m.font = UIFont.systemFont(ofSize: 20)
        m.textColor = .systemGreen
        return m
    }()
    
    //MARK: - Stack
    private func horStackView(_ space: CGFloat)-> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = space
        return stack
    }
    private lazy var weatherStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.isHidden = true
        return stack
    }()
    private lazy var btnStack: UIStackView = {
        return horStackView(80)
    }()
    private lazy var moyaStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .fill
        stack.isHidden = true
        return stack
    }()
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        view.addSubview(weatherStack)
        view.addSubview(btnStack)
        view.addSubview(moyaStack)
        view.addSubview(containerBox)
        
        weatherStack.addArrangedSubview(countryLabel)
        weatherStack.addArrangedSubview(weatherIcon)
        weatherStack.addArrangedSubview(weatherLabel)
        weatherStack.addArrangedSubview(tempLabel)
        weatherStack.addArrangedSubview(maxmintempLabel)
        weatherStack.addArrangedSubview(countryLabel)
        btnStack.addArrangedSubview(alamofireBtn)
        btnStack.addArrangedSubview(moyaBtn)
        moyaStack.addArrangedSubview(moyaLabel)
        
        containerBox.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(120)
            make.width.equalTo(318)
            make.height.equalTo(403)
        }
        weatherStack.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(142)
        }
        btnStack.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(570)
        }
        setIndividualSpacing()
        moyaStack.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(142)
            make.height.lessThanOrEqualTo(30)
        }
    }
    
    //MARK: - Function
    ///set space
    private func setIndividualSpacing(){
        countryLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherStack.snp.top)
        }
        weatherIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(47)
            make.height.lessThanOrEqualTo(120)
            make.width.greaterThanOrEqualTo(120)
        }
        weatherLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(180)
        }
        tempLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(243)
            make.height.lessThanOrEqualTo(48)
        }
        maxmintempLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(304)
        }
        moyaLabel.snp.makeConstraints{ make in
            make.top.equalTo(weatherStack.snp.top)
        }
    }
    @objc private func tapAlamofire(){
        getWeatherbyAlamofire()
        self.moyaStack.isHidden = true
    }
    private func configureView(weatherInformation: WeatherInformation){
        self.countryLabel.text = weatherInformation.name
        if let weather = weatherInformation.weather.first{
            self.weatherLabel.text = weather.main
            let icon = weather.icon
            let iconname = mapIconCodeToSystemName(icon)
            self.weatherIcon.image = UIImage(systemName: iconname)
        }
        let temp = Int(weatherInformation.main.temp-273.15)
        let maxtemp = Int(weatherInformation.main.temp_max-273.15)
        let mintemp = Int(weatherInformation.main.temp_min-273.15)
        self.tempLabel.text = "\(temp)°"
        self.maxmintempLabel.text = "최고 : \(maxtemp)°, 최저 : \(mintemp)°"
    }
    ///alamofire
    func getWeatherbyAlamofire(){
        let urlString = "https://api.openweathermap.org/data/2.5/weather?id=1835848&appid=0fc711f2f6190bd5ba5aed17e803d5bf"
        guard let url = URL(string: urlString) else {return}
        AF.request(url, method: .get, parameters: [:]).responseData(completionHandler: {response in
            let decoder = JSONDecoder()
            switch response.result {
            case let .success(data):
                do{
                    let weatherInfo = try decoder.decode(WeatherInformation.self, from: data)
                    DispatchQueue.main.async {
                        self.weatherStack.isHidden = false
                        self.configureView(weatherInformation: weatherInfo)
                    }
                    print(weatherInfo)
                } catch{
                    debugPrint(error)
                }
            case let . failure(error):
                debugPrint(error)
            }
            
        })
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
    ///moya
    @objc private func tapMoya(){
        getWeatherbyMoya()
        self.weatherStack.isHidden = true
    }
    //do,try catch 구문으로 실행할것
    func getWeatherbyMoya(){
        let moyaProvider = MoyaProvider<WeatherAPI>()
        moyaProvider.request(.getWeather){(result) in
            switch result {
            case let .success(response):
                guard let result = try?response.map(WeatherInformation.self) else {return}
                DispatchQueue.main.async {
                    self.moyaStack.isHidden = false
                    self.configureViewForMoya(weatherInformation: result)
                }
                print(result)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    private func configureViewForMoya(weatherInformation: WeatherInformation){
        let m1 = weatherInformation.name
        let temp = Int(weatherInformation.main.temp-273.15)
        self.moyaLabel.text = "지금 \(m1) 온도 \(temp)°"
    }
}

