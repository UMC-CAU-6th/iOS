//
//  Item.swift
//  Doughnut
//
//  Created by 황유빈 on 5/16/24.
//

import Foundation
import UIKit

struct adItem {
    var image: UIImage?
}

final class adItemLists {
    static let aditem: [adItem] = [
        adItem(image: UIImage(named: "image1.png")),
        adItem(image: UIImage(named: "image2.png")),
        adItem(image: UIImage(named: "image3.png")),
        adItem(image: UIImage(named: "image4.png"))
    ]
}

struct productItem {
    var image: UIImage?
    var name: String?
}

final class productItemLists {
    static let productitem: [productItem] = [
        productItem(image: UIImage(named: "product1.png"), name: "텀블러/보온병"),
        productItem(image: UIImage(named: "product2.png"), name: "머그/컵"),
        productItem(image: UIImage(named: "product3.png"), name: "라이프스타일"),
        productItem(image: UIImage(named: "product4.png"), name: "커피용품"),
        productItem(image: UIImage(named: "product5.png"), name: "케이크"),
        productItem(image: UIImage(named: "product6.png"), name: "스낵"),
        productItem(image: UIImage(named: "product7.png"), name: "스타벅스 모바일 상품권"),
        productItem(image: UIImage(named: "product8.png"), name: "스타벅스 모바일 카드")
    ]
}

struct bestItem {
    var image: UIImage?
    var name: String?
}

final class bestItemLists {
    static let bestitem: [bestItem] = [
        bestItem(image: UIImage(named: "best1.png"), name: "SS 스탠리 크림 켄처 텀블러 591ml"),
        bestItem(image: UIImage(named: "best2.png"), name: "그린 사이렌 도트 머그 355ml"),
        bestItem(image: UIImage(named: "best3.png"), name: "SS 블랙 앤 골드 스탠리 보온병 500ml"),
        bestItem(image: UIImage(named: "best4.png"), name: "SS 블랙 데비 머그 414ml"),
        bestItem(image: UIImage(named: "best5.png"), name: "SS 콩코드 사이렌 화이트 텀블러 591ml"),
        bestItem(image: UIImage(named: "best6.png"), name: "그린 사이렌 도트 머그 237ml"),
        bestItem(image: UIImage(named: "best7.png"), name: "[각인] 뉴턴 하우스 텀블러 355ml"),
        bestItem(image: UIImage(named: "best8.png"), name: "SS 엘마 블랙 텀블러 473ml")
    ]
}
