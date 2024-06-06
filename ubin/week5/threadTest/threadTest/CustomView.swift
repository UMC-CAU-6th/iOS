//
//  CustomView.swift
//  threadTest
//
//  Created by 황유빈 on 5/13/24.
//

import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView() {
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.backgroundColor = .white
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }

}
