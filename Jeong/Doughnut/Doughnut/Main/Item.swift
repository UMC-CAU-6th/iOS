//
//  File.swift
//  Doughnut
//
//  Created by 정의찬 on 5/2/24.
//

import Foundation
import UIKit

struct Item {
    var img: UIImage?
    var name: String
    var price: String
    var like: Int
    var comment: Int
}

final class DoughnutData {
    static let dataList: [Item] = [
        Item(img: UIImage(named: "remonDouhnet.png"),
             name: "레몬 도넛", price: "1억원", like: 299, comment: 111),
        Item(img: UIImage(named: "coffeDoughnet.png"),
             name: "커피 도넛", price: "3천원", like: 999, comment: 888),
        Item(img: UIImage(named: "chocolateDoughnet.png"),
             name: "초코 도넛", price: "4천원", like: 521, comment: 123),
        Item(img: UIImage(named: "remonDouhnet.png"),
             name: "레몬 도넛", price: "1억원", like: 299, comment: 111),
        Item(img: UIImage(named: "coffeDoughnet.png"),
             name: "커피 도넛", price: "3천원", like: 999, comment: 888),
        Item(img: UIImage(named: "chocolateDoughnet.png"),
             name: "초코 도넛", price: "4천원", like: 521, comment: 123),
        Item(img: UIImage(named: "remonDouhnet.png"),
             name: "레몬 도넛", price: "1억원", like: 299, comment: 111),
        Item(img: UIImage(named: "coffeDoughnet.png"),
             name: "커피 도넛", price: "3천원", like: 999, comment: 888),
        Item(img: UIImage(named: "chocolateDoughnet.png"),
             name: "초코 도넛", price: "4천원", like: 521, comment: 123),
        Item(img: UIImage(named: "remonDouhnet.png"),
             name: "레몬 도넛", price: "1억원", like: 299, comment: 111),
        Item(img: UIImage(named: "coffeDoughnet.png"),
             name: "커피 도넛", price: "3천원", like: 999, comment: 888),
        Item(img: UIImage(named: "chocolateDoughnet.png"),
             name: "초코 도넛", price: "4천원", like: 521, comment: 123),
        Item(img: UIImage(named: "remonDouhnet.png"),
             name: "레몬 도넛", price: "1억원", like: 299, comment: 111),
        Item(img: UIImage(named: "coffeDoughnet.png"),
             name: "커피 도넛", price: "3천원", like: 999, comment: 888),
        Item(img: UIImage(named: "chocolateDoughnet.png"),
             name: "초코 도넛", price: "4천원", like: 521, comment: 123)
    ]
}
