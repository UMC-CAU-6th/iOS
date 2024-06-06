//
//  AllCollectionViewCell.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/23/24.
//
import UIKit
import SnapKit

class AllCollectionViewCell: AdvertisementCell {
   
    
   //MARK: - 상속받은 클래스 재정의
    override func addComponent() {
        super.addComponent()
        self.addSubview(imageNameLabel)
    }
    
    
    
    override func makeContraints() {
        self.addComponent()
        
        advertiseImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(80)
            
        }
        
        
        imageNameLabel.snp.makeConstraints{ make in
            make.top.equalTo(advertiseImageView.snp.bottom).offset(10)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.greaterThanOrEqualTo(20)
        }

    }
    
    public func configure(model: AllItem, radius: CGFloat) {
        super.advertiseImageView.image = model.imageName
        super.advertiseImageView.layer.cornerRadius = radius
        super.imageNameLabel.text = model.name
    }
    
    //MARK: - 초기화
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
