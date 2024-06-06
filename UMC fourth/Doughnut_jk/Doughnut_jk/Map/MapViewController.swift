//
//  MapViewController.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/8/24.
//
import UIKit
import NMapsMap
import SnapKit
import CoreLocation
import Alamofire
import Toast_Swift

class MapViewController: UITabBarController, CLLocationManagerDelegate {
    
    var mapView: NMFMapView!
    let locationManager = CLLocationManager()
    var currentMarker: NMFMarker?
    
    
    //MARK: - 프로퍼티 생성
    // 위치 이동 버튼 생성
    private lazy var locationButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "mappin.and.ellipse")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        return button
    }()
    
    
    //마커 추가함수
      private func addMarker(at position: NMGLatLng) {
          // 기존 마커 제거
          currentMarker?.mapView = nil
          
          // 새로운 마커 추가
          let marker = NMFMarker(position: position)
          marker.iconImage = NMF_MARKER_IMAGE_BLUE
          marker.mapView = mapView
          
          currentMarker = marker
      }

    
    
    //레이아웃
    private func makeConstraint() {
        view.addSubview(locationButton)
        
        locationButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.width.height.equalTo(50) //
        }
        
        locationButton.addTarget(self, action: #selector(currentLocation), for: .touchUpInside)
    }
    
    
    
    //버튼동작
    @objc func currentLocation() {
        if let location = locationManager.location {
            let latLng = NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude)
            let cameraUpdate = NMFCameraUpdate(scrollTo: latLng)
            cameraUpdate.animation = .easeIn
            mapView.moveCamera(cameraUpdate)
            addMarker(at: latLng)
            receiveAddress(for: location)
        }
    }
    
    
    
    
    //MARK: - 현재위치
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latLng = NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude)
        mapView.locationOverlay.location = latLng
        print("업데이트된 위치: \(location.coordinate.latitude), \(location.coordinate.longitude)")
    }
    
    //위치 업데이트
    private func updateLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    

    
    
    
    //MARK: - 테이블뷰와 연결
    // 역지오코딩 결과를 가져오는 함수
    func receiveAddress(for location: CLLocation) {
        ReverseGeo.shared.reverseGeocode(location: location) { [weak self] address in
            guard let self = self else { return }
            if let address = address {
                self.view.makeToast("현재 위치: \(address)", duration: 1.0, position: .top)
                print("현재 위치: \(address)")
            } else {
                print("주소를 가져올 수 없습니다.")
            }
        }
    }
    
    // 도넛클릭시에 이동하는 함수
    func moveToLocation(latitude: Double, longitude: Double) {
        let latLng = NMGLatLng(lat: latitude, lng: longitude)
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let cameraUpdate = NMFCameraUpdate(scrollTo: latLng)
        cameraUpdate.animation = .easeIn
        mapView.moveCamera(cameraUpdate)
        addMarker(at: latLng)
        receiveAddress(for: location)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)
        
        makeConstraint()
        updateLocation()
      
    }
    
}
