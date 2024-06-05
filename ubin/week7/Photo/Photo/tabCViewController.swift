//
//  TabC.swift
//  Photo
//
//  Created by 황유빈 on 6/1/24.
//

import UIKit

class TabCViewController: BaseTabViewController {
    
    override var buttonTitle: String {
        return "C탭 앨범 부르기"
    }
    
    override var buttonColor: UIColor {
        return .gray
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            loadImage()
    }
        
    func loadImage() {
        let imageUrl = "https://image.msscdn.net/images/goods_img/20231006/3610962/3610962_17132312984287_500.jpg"
        CacheManager.shared.saveAndDownload(imageUrl: imageUrl) { [weak self] image in
            DispatchQueue.main.async {
                self?.image.image = image
            }
        }
    }
}
