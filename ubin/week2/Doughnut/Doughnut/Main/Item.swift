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
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리", price: "5천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리", price: "5천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리", price: "5천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리", price: "5천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리", price: "5천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리", price: "5천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리", price: "5천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리", price: "5천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리", price: "5천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리", price: "5천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리", price: "5천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리", price: "5천원"),
        Item(image: UIImage(named: "donutImage.png"), name: "스트로베리", price: "5천원")
    ]
}
