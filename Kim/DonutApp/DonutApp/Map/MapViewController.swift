//
//  MapViewController.swift
//  DonutApp
//
//  Created by 김나연 on 5/9/24.
//

import UIKit
import NMapsMap
import CoreLocation
import Alamofire

//MARK: - UI
class MapViewController: UIViewController,CLLocationManagerDelegate {
    private var mapView: NMFMapView!
    var selectedDonut: Item?
    
    private lazy var mapButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "mappin"), for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
        return btn
    }()
    private let locationManager = CLLocationManager()
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)
        view.addSubview(mapButton)
        mapButton.snp.makeConstraints{make in
            make.width.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if let selectedDonut = selectedDonut{
            addMarker(at: selectedDonut.location)
        }
    }
    
    //MARK: - Function
    ///버튼 눌렀을 때
    @objc private func mapButtonTapped(){
        if CLLocationManager.locationServicesEnabled(){
            let status = locationManager.authorizationStatus
            handleLocationAuthorizationStatus(status)
            //print("위치 서비스 ON")
            locationManager.startUpdatingLocation()
        } else{
            print("위치 서비스 OFF")
        }
    }
    private func handleLocationAuthorizationStatus(_ status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            print("위치 권한이 거부되었습니다.")
        case .authorizedWhenInUse, .authorizedAlways:
            print("위치 서비스 ON")
            locationManager.startUpdatingLocation()
        @unknown default:
            fatalError("알 수 없는 위치 권한 상태")
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude))
            cameraUpdate.animation = .easeIn
            mapView.moveCamera(cameraUpdate)
            let marker = NMFMarker()
            marker.position = NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude)
            marker.mapView = mapView
            marker.iconTintColor = .systemBlue
            ReverseGeo.shared.reverseGeocode(location: location){address in
                if let address = address {
                    self.showToast(message: address)
                } else {
                    self.showToast(message: "주소를 찾을 수 없습니다")
                }
            }
        }
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed.\(error.localizedDescription)")
    }
    ///마커 추가
    private func addMarker(at location: Location){
        let cu = NMFCameraUpdate(scrollTo: NMGLatLng(lat: location.lat, lng: location.lng))
        cu.animation = .easeIn
        mapView.moveCamera(cu)
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: location.lat, lng: location.lng)
        marker.mapView = mapView
        marker.iconImage = NMFOverlayImage(name: "donut2")
        let lc = CLLocation(latitude: location.lat, longitude: location.lng)
        print(lc)
        ReverseGeo.shared.reverseGeocode(location: lc){address in
            if let address = address {
                self.showToast(message: address)
            } else {
                self.showToast(message: "주소를 찾을 수 없습니다")
            }
        }
        
    }
    ///토스트 알림
    func showToast(message: String){
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2-75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = .black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 5
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        toastLabel.snp.makeConstraints{make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.centerX.equalToSuperview()
        }
        print(message)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0}, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
    }
}
