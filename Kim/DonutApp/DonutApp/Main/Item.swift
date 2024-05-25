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
}
final class DonutData{
    static var dataList: [Item] = [
        Item(img: UIImage(named: "donuticon"), name: "도넛 1", price: "$1.0", like: 10),
        Item(img: UIImage(named: "donuticon"), name: "도넛 2", price: "$1.0", like: 10),
        Item(img: UIImage(named: "donuticon"), name: "도넛 3", price: "$1.0", like: 10),
        Item(img: UIImage(named: "donuticon"), name: "도넛 4", price: "$1.0", like: 10),
        Item(img: UIImage(named: "donuticon"), name: "도넛 5", price: "$1.0", like: 1),
        Item(img: UIImage(named: "donuticon"), name: "도넛 6", price: "$1.0", like: 0),
        Item(img: UIImage(named: "donuticon"), name: "도넛 7", price: "$1.0", like: 17),
        Item(img: UIImage(named: "donuticon"), name: "도넛 8", price: "$1.5", like: 10),
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
    ]
}
