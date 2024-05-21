//
//  HeaderCollectionReusableView.swift
//  Doughnut
//
//  Created by 정의찬 on 5/21/24.
//

import UIKit
import SnapKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "headerCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private lazy var headerText: UILabel = {
        let text = UILabel()
        text.font = UIFont.pretendard(size: 26, weight: .bold)
        text.textColor = UIColor.black
        return text
    }()
    
    private lazy var rightArrow: UIButton = {
        let btn = UIButton()
        var configure = UIButton.Configuration.plain()
        let image = UIImage(systemName: "chevron.right")
        configure.image = image
        
        btn.configuration = configure
        return btn
    }()
    
    private func addComponent() {
        self.addSubview(headerText)
        self.addSubview(rightArrow)
    }
    
    private func makeConstraints() {
        addComponent()
        
        headerText.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(0)
            make.width.greaterThanOrEqualTo(10)
            make.height.greaterThanOrEqualTo(10)
        }
        
        rightArrow.snp.makeConstraints{ make in
            make.right.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(0)
            make.width.greaterThanOrEqualTo(10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    
    public func configure(text: String) {
        self.headerText.text = text
        print(headerText.text)
    }
    

    
    
    
}
