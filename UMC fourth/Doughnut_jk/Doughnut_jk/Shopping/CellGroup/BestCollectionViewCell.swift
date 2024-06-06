//
//  BestCollectionViewCell.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/23/24.
//
import UIKit
import SnapKit

class BestItemCell: AdvertisementCell {
    
    
    //MARK: - 상속받은 클래스 재정의

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
            make.height.lessThanOrEqualTo(20)
            make.top.equalTo(super.advertiseImageView.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-3)
            make.left.equalToSuperview()
            make.width.greaterThanOrEqualTo(50)

            
        }
    }
    
    public func configure(model: BestItem) {
        super.advertiseImageView.image = model.imageName
        super.imageNameLabel.text = model.name
        super.advertiseImageView.layer.cornerRadius = 5
    }
    
    
    //MARK: - 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}

