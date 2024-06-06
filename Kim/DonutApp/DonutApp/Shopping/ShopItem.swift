//
//  ShopItem.swift
//  DonutApp
//
//  Created by 김나연 on 5/23/24.
//

import Foundation
import UIKit

struct ShopAd{
    var img: UIImage?
}
struct ShopAp{
    var img: UIImage?
    var name: String
}
struct ShopBi{
    var img: UIImage?
    var name: String
}
final class ShopItem{
    static let adDataList: [ShopAd] = [
        ShopAd(img: UIImage(named: "ad1")),
        ShopAd(img: UIImage(named: "ad2")),
        ShopAd(img: UIImage(named: "ad3")),
        ShopAd(img: UIImage(named: "ad4"))
    ]
    static let apDataList: [ShopAp] = [
        ShopAp(img: UIImage(named: "allpd1"), name: "텀블러/보온병"),
        ShopAp(img: UIImage(named: "allpd2"), name: "머그/컵"),
        ShopAp(img: UIImage(named: "allpd3"), name: "라이프 스타일"),
        ShopAp(img: UIImage(named: "allpd4"), name: "티/커피용품"),
        ShopAp(img: UIImage(named: "allpd5"), name: "케이크"),
        ShopAp(img: UIImage(named: "allpd6"), name: "초콜릿/스낵"),
        ShopAp(img: UIImage(named: "allpd7"), name: "모바일 상품권"),
        ShopAp(img: UIImage(named: "allpd8"), name: "모바일 카드")
    ]
    static let biDataList: [ShopBi] = [
        ShopBi(img: UIImage(named: "bi1"), name: "SS 콩코드 사이렌 화이트 텀블러 591ml"),
        ShopBi(img: UIImage(named: "bi2"), name: "그린 사이렌 도트 머그 237ml"),
        ShopBi(img: UIImage(named: "bi3"), name: "[각인] 뉴턴 하우스 텀블러 355ml"),
        ShopBi(img: UIImage(named: "bi4"), name: "SS 엘마 블랙 텀블러 473ml"),
        ShopBi(img: UIImage(named: "bi5"), name: "까만 텀블러"),
        ShopBi(img: UIImage(named: "bi6"), name: "회색 컵"),
        ShopBi(img: UIImage(named: "bi7"), name: "까만 사이렌 컵"),
        ShopBi(img: UIImage(named: "bi8"), name: "은색 텀블러")
    ]
}
