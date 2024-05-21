//
//  CollectionData.swift
//  Doughnut
//
//  Created by 정의찬 on 5/20/24.
//

import Foundation
import UIKit

struct AdvertisementData {
    var imageName: UIKit.UIImage?
}

struct BestProductData {
    var imageName: UIKit.UIImage?
    var name: String
}

struct BestItemData {
    var imageName: UIKit.UIImage?
    var name: String
}


final class AdverDataClass {
    
    static let dataLists: [AdvertisementData] = [
            AdvertisementData(imageName: UIImage(named: "firstAd.jpeg")),
            AdvertisementData(imageName: UIImage(named: "secondAd.jpeg")),
            AdvertisementData(imageName: UIImage(named: "thirdAd.jpeg")),
            AdvertisementData(imageName: UIImage(named: "fourthAd.jpeg"))
    ]
    
    static let productList: [BestProductData] = [
        BestProductData(imageName: UIImage(named: "beOne.png"), name: "텀블러"),
        BestProductData(imageName: UIImage(named: "beTwo.png"), name: "컵"),
        BestProductData(imageName: UIImage(named: "beThree.png"), name: "라이프스타일"),
        BestProductData(imageName: UIImage(named: "beFour.png"), name: "커피"),
        BestProductData(imageName: UIImage(named: "beFive.png"), name: "케이크"),
        BestProductData(imageName: UIImage(named: "beSix.png"), name: "초콜릿"),
        BestProductData(imageName: UIImage(named: "beSeven.png"), name: "스타벅스 모바일 상품권"),
        BestProductData(imageName: UIImage(named: "beEight.png"), name: "스타벅스 모바일 카드"),
        ]
    
    static let bestItem: [BestItemData] = [
        BestItemData(imageName: UIImage(named: "itemOne.jpeg"), name: "사이렌 화이트 텀블러"),
        BestItemData(imageName: UIImage(named: "itemTwo.jpeg"), name: "그린 사이렌 도그 머그"),
        BestItemData(imageName: UIImage(named: "itemThree.jpeg"), name: "뉴턴 블라블라블라"),
        BestItemData(imageName: UIImage(named: "itemFour.jpeg"), name: "SS 엠마 블랙 뭐라뭐라")
    ]
}

