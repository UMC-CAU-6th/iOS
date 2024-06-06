//
//  Item.swift
//  DonutApp
//
//  Created by 김나연 on 5/2/24.
//

import Foundation
import UIKit
///더미 데이터 만들기
///더미 데이터를 만들 때 static으로 만든다(메모리 낭비 방지)
struct Item{
    var img: UIImage?
    var name: String
    var price: String
    var like: Int
    var location: Location
}
struct Location{
    var lat: Double
    var lng: Double
}
final class DonutData{
    static var dataList: [Item] = [
        Item(img: UIImage(named: "donuticon"), name: "도넛 1", price: "$1.0", like: 10, location: Location(lat: 37.545316334218, lng: 126.96488274576)),
        Item(img: UIImage(named: "donuticon"), name: "도넛 2", price: "$1.0", like: 10, location: Location(lat: 37.506968430257, lng: 126.95895327228)),
        Item(img: UIImage(named: "donuticon"), name: "도넛 3", price: "$1.0", like: 10, location: Location(lat: 37.609719798209, lng: 126.91618129237)),
        Item(img: UIImage(named: "donuticon"), name: "도넛 4", price: "$1.0", like: 10, location: Location(lat: 37.547404275774, lng: 126.91525561706)),
        Item(img: UIImage(named: "donuticon"), name: "도넛 5", price: "$1.0", like: 1, location: Location(lat: 33.506293743083, lng: 126.49322667639)),
        Item(img: UIImage(named: "donuticon"), name: "도넛 6", price: "$1.0", like: 0, location: Location(lat: 37.551597567603, lng: 126.90010136942)),
        Item(img: UIImage(named: "donuticon"), name: "도넛 7", price: "$1.0", like: 17, location: Location(lat: 36.340257647200, lng: 127.39003625574)),
        Item(img: UIImage(named: "donuticon"), name: "도넛 8", price: "$1.5", like: 10, location: Location(lat: 37.551229286981, lng: 126.98823629238)),
        /*
        Item(img: UIImage(named: "donuticon"), name: "도넛 9", price: "$1.0", like: 10),
        Item(img: UIImage(named: "donuticon"), name: "도넛 10", price: "$1.0", like: 10),
        Item(img: UIImage(named: "donuticon"), name: "도넛 11", price: "$1.0", like: 11),
        Item(img: UIImage(named: "donuticon"), name: "도넛 12", price: "$1.0", like: 10),
        Item(img: UIImage(named: "donuticon"), name: "도넛 13", price: "$1.3", like: 20),
        Item(img: UIImage(named: "donuticon"), name: "도넛 14", price: "$1.0", like: 10),
        Item(img: UIImage(named: "donuticon"), name: "도넛 15", price: "$1.0", like: 10),
        Item(img: UIImage(named: "donuticon"), name: "도넛 16", price: "$1.0", like: 10),
        Item(img: UIImage(named: "donuticon"), name: "도넛 17", price: "$1.0", like: 9),
        Item(img: UIImage(named: "donuticon"), name: "도넛 18", price: "$1.1", like: 10),
        Item(img: UIImage(named: "donuticon"), name: "도넛 19", price: "$1.0", like: 10),
        Item(img: UIImage(named: "donuticon"), name: "도넛 20", price: "$1.0", like: 10),
         */
    ]
}
