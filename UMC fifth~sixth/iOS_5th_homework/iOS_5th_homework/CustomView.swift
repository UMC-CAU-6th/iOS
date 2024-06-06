//
//  customView.swift
//  iOS_5th_homework
//
//  Created by 한지강 on 5/17/24.
//

import UIKit
import SnapKit

class CustomView: UIView {
    
    let shadowView = UIView()
    let cornerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(shadowView)
        shadowView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowRadius = 5
        shadowView.layer.cornerRadius = 15
        shadowView.layer.masksToBounds = false
        
        shadowView.addSubview(cornerView)
        cornerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        cornerView.backgroundColor = .systemTeal
        cornerView.layer.cornerRadius = 15
        cornerView.layer.masksToBounds = true
    }
    
    func configureInnerViewColor(_ color: UIColor) {
        cornerView.backgroundColor = color
    }
}
