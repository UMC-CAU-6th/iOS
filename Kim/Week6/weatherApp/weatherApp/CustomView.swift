//
//  CustomView.swift
//  weatherApp
//
//  Created by 김나연 on 5/22/24.
//

import UIKit
import SnapKit

class CustomView: UIView {
    private let containerView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 30
        v.layer.borderColor = UIColor.black.cgColor
        v.layer.borderWidth = 10
        v.backgroundColor = .clear
        return v
    }()
    init(){
        super.init(frame: .zero)
        addSubview(containerView)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setConstraints(){
        containerView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}

