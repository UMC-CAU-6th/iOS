//
//  Item.swift
//  Doughnut
//
//  Created by 황유빈 on 5/2/24.
//

import Foundation
import UIKit

struct Item {
    var image: UIImage?
    var name: String?
    var price: String?
}

final class ItemLists {
    static let item: [Item] = [
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리1", price: "1천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리2", price: "2천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리3", price: "3천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리4", price: "4천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리5", price: "5천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리6", price: "6천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리7", price: "7천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리8", price: "8천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리9", price: "9천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리10", price: "만원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리11", price: "만천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리12", price: "만이천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리13", price: "만삼천원")
    ]
}
