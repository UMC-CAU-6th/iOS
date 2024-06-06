//
//  MapViewController.swift
//  DoughnutStore
//
//  Created by 황유빈 on 6/1/24.
//

import UIKit
import SnapKit
import NMapsMap
import CoreLocation
import Alamofire

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    private lazy var button: UIButton = {
        let button = UIButton()
            
        var config = UIButton.Configuration.filled()
        var title = AttributeContainer()
        title.font = UIFont.pretendard(size: 15, weight: .regular)
        config.attributedTitle = AttributedString("현재 위치", attributes: title)
        config.baseBackgroundColor = UIColor.gray
        config.background.cornerRadius = 39
        config.baseForegroundColor = .white
           
        button.configuration = config
        button.addTarget(self, action: #selector(clickedNowLocation), for: .touchUpInside)
            
        return button
    }()
    
    private lazy var mapView: NMFMapView = {
        let mapView = NMFMapView(frame: self.view.bounds)
        
        return mapView
    }()
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        view.addSubview(button)
            
        makeConstraints()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()

    }
    
    //MARK: - Function
    private func showToast(message: String, font: UIFont) {
        DispatchQueue.main.async {
            print("showToast called with message: \(message)")
            let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width / 2 - 75, y: self.view.frame.size.height - 100, width: 150, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.font = font
            toastLabel.textAlignment = .center
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10
            toastLabel.clipsToBounds = true
            self.view.addSubview(toastLabel)
            
            UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: { isCompleted in
                toastLabel.removeFromSuperview()
                print("Toast removed")
            })
        }
    }

    private func showErrorToast(message: String) {
        showToast(message: message, font: UIFont.systemFont(ofSize: 15, weight: .regular))
    }

    private func configureView(addressInfo: LocationInfo) {
        guard let result = addressInfo.results.first else {
            showErrorToast(message: "주소를 찾을 수 없습니다.")
            return
        }
        
        let address = [result.region.area0.name, result.region.area1.name, result.region.area2.name, result.region.area3.name, result.region.area4.name].joined(separator: " ")
        
        showToast(message: address, font: UIFont.pretendard(size: 15, weight: .regular))
    }

    private func reverseGeocode(lat: Double, lng: Double) {
        let header1 = HTTPHeader(name: "X-NCP-APIGW-API-KEY-ID", value: "uhim5pf2qr")
        let header2 = HTTPHeader(name: "X-NCP-APIGW-API-KEY", value: "r4SnocFkUgtmPIShxOeM2JpHF4mJrnlaIwfJAtJs")
        let headers = HTTPHeaders([header1, header2])
        let url = "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc"
        let parameters: [String: Any] = [
            "coords": "\(lng),\(lat)",
            "orders": "addr,roadaddr",
            "output": "json"
        ]
        
        print("Request URL: \(url)")
        print("Request Headers: \(headers)")
        print("Request Parameters: \(parameters)")
        
        AF.request(url, method: .get, parameters: parameters, headers: headers).validate().responseData(completionHandler: { response in
            
            switch response.result {
            case let .success(data):
                do {
                    let decoder = JSONDecoder()
                    let addressInfo = try decoder.decode(LocationInfo.self, from: data)
                    DispatchQueue.main.async {
                        self.configureView(addressInfo: addressInfo)
                    }
                } catch {
                    print("Decoding error: \(error)")
                    self.showErrorToast(message: "데이터를 처리하는 도중 오류가 발생했습니다.")
                }
            case let .failure(error):
                print("Request error: \(error)")
                self.showErrorToast(message: "네트워크 오류가 발생했습니다.")
            }
        })
    }
    
    func updateMapWithCoordinates(lat: Double, lng: Double) {
        let coordinate = NMGLatLng(lat: lat, lng: lng)
        
        // 현 위치로 카메라 이동
        let cameraUpdate = NMFCameraUpdate(scrollTo: coordinate)
        cameraUpdate.animation = .easeIn
        mapView.moveCamera(cameraUpdate)
        
        // 마커 표시
        let marker = createCustomMarker(at: coordinate, with: .purple)
        marker.mapView = mapView
        
        // 역지오 코딩 요청
        reverseGeocode(lat: lat, lng: lng)
    }
       
    private func createCustomMarker(at coordinate: NMGLatLng, with color: UIColor) -> NMFMarker {
        let marker = NMFMarker()
        marker.position = coordinate
        marker.width = 25
        marker.height = 35
        marker.iconTintColor = color
        return marker
    }
    
    
    //MARK: - Constraints
    private func makeConstraints() {
        button.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-100)
        }
    }
    
    //MARK: - Event Handler
    @objc private func clickedNowLocation() {
        print("현재위치")
        
        locationManager.startUpdatingLocation()
                    
        //현 위치로 카메라 이동
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? 0, lng: locationManager.location?.coordinate.longitude ?? 0))
        cameraUpdate.animation = .easeIn
        mapView.moveCamera(cameraUpdate)
                    
        // 마커 표시
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? 0, lng: locationManager.location?.coordinate.longitude ?? 0)
        
        // 마커 커스텀
        marker.width = 25
        marker.height = 35
        marker.iconTintColor = UIColor.purple
        
        marker.mapView = mapView
        
        //역지오 코딩 요청
        if let lat = locationManager.location?.coordinate.latitude,
           let lng = locationManager.location?.coordinate.longitude {
                    reverseGeocode(lat: lat, lng: lng)
        }
    }
}
