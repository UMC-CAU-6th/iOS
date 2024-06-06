//
//  CustomView.swift
//  CountdownApp
//
//  Created by 김나연 on 5/22/24.
//

import UIKit
import SnapKit

class CustomView: UIView {
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 15
        view.layer.shadowOpacity = 0.8
        return view
    }()
    private let innerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    init(bgColor: UIColor){
        super.init(frame: .zero)
        innerView.backgroundColor = bgColor
        addSubview(containerView)
        containerView.addSubview(innerView)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        innerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func setConstraints(){
        containerView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        innerView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}
