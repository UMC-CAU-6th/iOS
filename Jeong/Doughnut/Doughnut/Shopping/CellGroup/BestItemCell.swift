//
//  BestItem.swift
//  Doughnut
//
//  Created by 정의찬 on 5/21/24.
//

import UIKit
import SnapKit

class BestItemCell: AdvertisementCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func addComponent() {
        super.addComponent()
        self.addSubview(imageNameLabel)
    }
    
    override func makeContraints() {
        self.addComponent()
        
        advertiseImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.lessThanOrEqualTo(180)
        }
        
        imageNameLabel.snp.makeConstraints { make in
            make.top.equalTo(super.advertiseImageView.snp.bottom).offset(5)
            make.bottom.equalToSuperview().offset(-3)
            make.left.equalToSuperview()
            make.width.greaterThanOrEqualTo(50)

            
        }
    }
    
    public func configure(model: BestItemData) {
        super.advertiseImageView.image = model.imageName
        super.imageNameLabel.text = model.name
    }
    
    
}
