//
//  AllProductCell.swift
//  DonutApp
//
//  Created by 김나연 on 5/23/24.
//

import UIKit
import SnapKit

class AllProductCell: AdCollectionViewCell{
    override init(frame: CGRect){
        super.init(frame: frame)
        self.makeConstraints()
    }
    required init?(coder: NSCoder){
        fatalError()
    }
    override func addComponent() {
        super.addComponent()
        self.addSubview(adImgName)
    }
    override func makeConstraints() {
        self.addComponent()
        adImg.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(80)
        }
        adImgName.snp.makeConstraints{ make in
            make.top.equalTo(adImg.snp.bottom).offset(5)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.greaterThanOrEqualTo(20)
        }
    }
    public func configure(model: ShopAp, radius: CGFloat) {
        super.adImg.image = model.img
        super.adImg.layer.cornerRadius = radius
        super.adImgName.text = model.name
    }
}
