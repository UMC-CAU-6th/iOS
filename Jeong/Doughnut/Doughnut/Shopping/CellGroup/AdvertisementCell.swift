//
//  advertisementCell.swift
//  Doughnut
//
//  Created by 정의찬 on 5/20/24.
//

import UIKit
import SnapKit

class AdvertisementCell: UICollectionViewCell {
    
    static let identifier = "a"
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Property
    
    private lazy var advertiseImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private func addComponent() {
        self.addSubview(advertiseImageView)
    }
    
    private func makeContraints() {
        addComponent()
        
        advertiseImageView.snp.makeConstraints{ make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    public func configure(model: AdvertisementData) {
        
        self.advertiseImageView.image = model.imageName
    }
    
}
