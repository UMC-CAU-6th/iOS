//
//  BestItem.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/23/24.
//

import Foundation
import UIKit


struct AdvertisementData {
    var imageName: UIImage?
}


struct AllItem {
    var imageName: UIImage?
    var name: String
}


struct BestItem {
    var imageName: UIImage?
    var name: String
}


final class AdverDataClass {
    
    static let dataLists: [AdvertisementData] = [
        AdvertisementData(imageName: UIImage(named: "Ad1.jpeg")),
        AdvertisementData(imageName: UIImage(named: "Ad2.jpeg")),
        AdvertisementData(imageName: UIImage(named: "Ad3.jpeg")),
        AdvertisementData(imageName: UIImage(named: "Ad4.jpeg"))
    ]
    
    
    
    
    static let allLists: [AllItem] = [
        AllItem(imageName: UIImage(named: "all1.png"), name: "텀블러/보온병"),
        AllItem(imageName: UIImage(named: "all2.png"), name: "텀블러"),
        AllItem(imageName: UIImage(named: "all3.png"), name: "텀블러"),
        AllItem(imageName: UIImage(named: "all4.png"), name: "보온병"),
        AllItem(imageName: UIImage(named: "all5.png"), name: "텀블러"),
        AllItem(imageName: UIImage(named: "all6.png"), name: "보온병"),
        AllItem(imageName: UIImage(named: "all7.png"), name: "보온병"),
        AllItem(imageName: UIImage(named: "all8.png"), name: "텀블러")
    ]
    
    
    
    static let bestLists: [BestItem] = [
        BestItem(imageName: UIImage(named: "Best1.png"), name: "고급텀블러"),
        BestItem(imageName: UIImage(named: "Best2.png"), name: "우산"),
        BestItem(imageName: UIImage(named: "Best3.png"), name: "머그컵"),
        BestItem(imageName: UIImage(named: "Best4.png"), name: "주전자"),
        BestItem(imageName: UIImage(named: "Best5.png"), name: "모자"),
        BestItem(imageName: UIImage(named: "Best6.png"), name: "카드"),
        BestItem(imageName: UIImage(named: "Best7.png"), name: "초콜릿"),
        BestItem(imageName: UIImage(named: "Best8.png"), name: "티켓")
    ]
    
    
    
}
