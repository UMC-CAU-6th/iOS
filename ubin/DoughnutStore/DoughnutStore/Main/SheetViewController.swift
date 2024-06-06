//
//  SheetViewController.swift
//  DoughnutStore
//
//  Created by 황유빈 on 6/1/24.
//

import UIKit

class SheetViewController: UIViewController {

    private lazy var exitButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("닫기", for: .normal)
        btn.titleLabel?.font = UIFont.pretendard(size: 15, weight: .regular)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(clickedButton), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.detents = [.medium()]
            sheetPresentationController.prefersGrabberVisible = true
        }
        addProperty()
        makeConstraints()
        
    }
    
    //MARK : - 프로퍼티 추가함수
    private func addProperty() {
        self.view.addSubview(exitButton)
        self.view.bringSubviewToFront(exitButton)
    }
    
    //MARK : - Constraint
    private func makeConstraints() {
        exitButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.height.width.equalTo(100)
        }
    }
    
    //MARK : - function
    @objc private func clickedButton() {
        dismiss(animated: true, completion: nil)
    }
}
