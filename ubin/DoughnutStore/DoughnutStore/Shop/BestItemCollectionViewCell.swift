//
//  BestItemCollectionViewCell.swift
//  DoughnutStore
//
//  Created by 황유빈 on 6/1/24.
//

import UIKit

class BestItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemcollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented required init?(coder: NSCoder)")
    }
    
    
    //MARK: - image
    private lazy var itemImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    
    //MARK: - info
    private lazy var itemName: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.font = UIFont.pretendard(size: 12, weight: .bold)
        name.textAlignment = .center
        name.numberOfLines = 0
        name.lineBreakMode = .byWordWrapping
        return name
    }()
    
    //MARK: - Constraints
    ///프로퍼티 뷰 추가
    private func addProperty() {
        self.addSubview(itemImage)
        self.addSubview(itemName)
    }
    
    ///오토레이아웃
    private func makeConstraints() {
        
        /* product 이미지 */
        itemImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        /* product 이름 */
        itemName.snp.makeConstraints { make in
            make.top.equalTo(itemImage.snp.bottom).offset(5)
            make.height.greaterThanOrEqualTo(24)
            make.width.equalTo(itemImage.snp.width)
            make.centerX.equalTo(itemImage)
        }
    }
    
    //MARK: - functions
    public func configure(model: bestItem) {
        addProperty()
        makeConstraints()
        
        self.itemImage.image = model.image
        self.itemName.text = model.name
    }

}
