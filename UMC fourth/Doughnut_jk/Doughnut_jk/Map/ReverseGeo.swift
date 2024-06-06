//
//  ReverseGeo.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/31/24.
//
import Foundation
import Alamofire
import CoreLocation

class ReverseGeo {
    static let shared = ReverseGeo()
    
    private let baseURL = "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc"
    private let clientID = "at31nztw79"
    private let clientSecret = "e1sTC2CqhwQl71k3i1idMQHLvJ4dIGBLJ7i5P8hs"
    
    private init() { }
    
    func reverseGeocode(location: CLLocation, completion: @escaping (String?) -> Void) {
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        let parameters: [String: Any] = [
            "request": "coordsToaddr",
            "coords": "\(longitude),\(latitude)",
            "sourcecrs": "epsg:4326",
            "output": "json",
            "orders": "legalcode,admcode"
        ]
        
        let headers: HTTPHeaders = [
            "X-NCP-APIGW-API-KEY-ID": clientID,
            "X-NCP-APIGW-API-KEY": clientSecret
        ]
        
        AF.request(baseURL, parameters: parameters, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any],
                   let results = json["results"] as? [[String: Any]],
                   let firstResult = results.first,
                   let region = firstResult["region"] as? [String: Any],
                   let area1 = region["area1"] as? [String: Any],
                   let area2 = region["area2"] as? [String: Any],
                   let area3 = region["area3"] as? [String: Any] {
                   let address = "\(area1["name"] ?? "") \(area2["name"] ?? "") \(area3["name"] ?? "")"
                    completion(address)
                } else {
                    completion(nil)
                }
            case .failure(let error):
                print("역지오코딩 오류: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}
