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

final class AdverDataClass {
    static let dataLists: [AdvertisementData] = [
            AdvertisementData(imageName: UIImage(named: "firstAd.jpeg")),
            AdvertisementData(imageName: UIImage(named: "secondAd.jpeg")),
            AdvertisementData(imageName: UIImage(named: "thirdAd.jpeg")),
            AdvertisementData(imageName: UIImage(named: "fourthAd.jpeg"))
    ]
}
