//
//  BestItemCell.swift
//  DonutApp
//
//  Created by 김나연 on 5/23/24.
//

import UIKit
import SnapKit

class BestItemCell: AdCollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func addComponent() {
        super.addComponent()
        self.addSubview(adImgName)
    }
    override func makeConstraints() {
        self.addComponent()
        adImg.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.lessThanOrEqualTo(180)
        }
        adImgName.snp.makeConstraints { make in
            make.top.equalTo(super.adImg.snp.bottom).offset(5)
            make.bottom.equalToSuperview().offset(-3)
            make.left.equalToSuperview()
            make.width.greaterThanOrEqualTo(50)
        }
    }
    public func configure(model: ShopBi) {
        super.adImg.image = model.img
        super.adImgName.text = model.name
    }
}
