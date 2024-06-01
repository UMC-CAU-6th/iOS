//
//  ShopCollectionViewCell.swift
//  Doughnut
//
//  Created by 황유빈 on 5/16/24.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "collectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented required init?(coder: NSCoder)")
    }
    
    
    //MARK: - image
    private lazy var productImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = img.frame.size.width/2
        return img
    }()
    
    //MARK: - info
    private lazy var productName: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.font = UIFont.pretendard(size: 12, weight: .regular)
        name.textAlignment = .center
        name.numberOfLines = 0
        name.lineBreakMode = .byWordWrapping
        return name
    }()
    
    //MARK: - Constraints
    ///프로퍼티 뷰 추가
    private func addProperty() {
        self.addSubview(productImage)
        self.addSubview(productName)
    }
    
    ///사진 동그랗게
    override func layoutSubviews() {
            super.layoutSubviews()
            productImage.layer.cornerRadius = productImage.frame.size.width / 2
        }
    
    ///오토레이아웃
    private func makeConstraints() {
        
        /* product 이미지 */
        productImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(70)
            make.width.equalTo(70)
        }
        
        /* product 이름 */
        productName.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).offset(5)
            make.height.greaterThanOrEqualTo(24)
            make.width.equalTo(productImage.snp.width)
            make.centerX.equalTo(productImage)
        }
    }
    
    //MARK: - functions
    public func configure(model: productItem) {
        addProperty()
        makeConstraints()
        
        self.productImage.image = model.image
        self.productName.text = model.name
    }
    
}
