//
//  advertisementCell.swift
//  Doughnut
//
//  Created by 정의찬 on 5/20/24.
//

import UIKit
import SnapKit

class AdvertisementCell: UICollectionViewCell {
    
    static let identifier = "advertisementCell"
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Property
    
    public lazy var advertiseImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        return view
    }()
    
    public lazy var imageNameLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.pretendard(size: 14, weight: .medium)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    public func addComponent() {
        self.addSubview(advertiseImageView)
    }
    
    public func makeContraints() {
        addComponent()
        
        advertiseImageView.snp.makeConstraints{ make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    public func configure(model: AdvertisementData, radius: CGFloat) {
        
        self.advertiseImageView.image = model.imageName
        self.advertiseImageView.layer.cornerRadius = radius
    }
    
}
