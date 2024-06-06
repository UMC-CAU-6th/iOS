//
//  Item.swift
//  DoughnutStore
//
//  Created by 황유빈 on 6/1/24.
//

import Foundation
import UIKit

struct Location {
    var lat: Float
    var lng: Float
}

struct Item {
    var image: UIImage?
    var name: String?
    var price: String?
    var locationInfo: Location
}

final class ItemLists {
    static let item: [Item] = [
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리 도넛", price: "2000원", locationInfo: Location(lat: 37.5704, lng: 127.0058)),
        Item(image: UIImage(named: "donutImage.png"), name: "글레이즈드 도넛", price: "1700원", locationInfo: Location(lat: 35.8689, lng: 128.5997)),
        Item(image: UIImage(named: "donutImage.png"), name: "초코 도넛", price: "1900원", locationInfo: Location(lat: 35.8439, lng: 129.2131)),
        Item(image: UIImage(named: "donutImage.png"), name: "바나나 도넛", price: "2300원", locationInfo: Location(lat: 35.1537, lng: 129.1174)),
    ]
}
