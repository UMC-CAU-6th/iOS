//
//  Item.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/8/24.
//

import Foundation
import UIKit

struct Item {
    var img: UIImage?
    var name: String
    var price: String
    var locationInfo: Location
}

struct Location {
    var lat: Float
    var lng: Float
}


final class DoughnutData {
    static let dataList: [Item] = [
        Item(img: UIImage(named: "pinkDoughnut.png"),
             name: "핑크 도넛", price: "가격 : 4000원", locationInfo: Location(lat: 38.21398, lng: 128.5984)),
        Item(img: UIImage(named: "chocoDoughnut.png"),
             name: "초코 도넛", price: "가격 : 4000원", locationInfo: Location(lat: 38.21678, lng: 128.5944)),
        Item(img: UIImage(named: "bananaDoughnut.png"),
             name: "옐로우 도넛", price: "가격 : 4000원", locationInfo: Location(lat: 38.19678, lng: 128.5983)),
        Item(img: UIImage(named: "appleDoughnut.png"),
             name: "레드 도넛", price: "가격 : 4000원", locationInfo: Location(lat: 37.53615, lng: 126.9722)),
        Item(img: UIImage(named: "matchaDoughnut.png"),
             name: "초록 도넛", price: "가격 : 4000원", locationInfo: Location(lat: 37.53615, lng: 127.9722))
    ]
}
