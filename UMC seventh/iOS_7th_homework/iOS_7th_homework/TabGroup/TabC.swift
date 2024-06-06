//
//  TabC.swift
//  iOS_7th_homework
//
//  Created by 한지강 on 5/31/24.
//
import UIKit
import SnapKit

class TabCViewController: UIViewController {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        makeConstraints()
        downloadImage()
    }

    func makeConstraints() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
    }
    
    func downloadImage() {
        let imageUrl = "https://image.msscdn.net/images/goods_img/20231006/3610962/3610962_17132312984287_500.jpg"
        
        CacheManager.shared.saveAndDownload(urlString: imageUrl) { [weak self] image in
            DispatchQueue.main.async {
                guard let self = self else {
                    return
                }
                guard let image = image else {
                    return
                }
                self.imageView.image = image
            }
        }
    }
}
