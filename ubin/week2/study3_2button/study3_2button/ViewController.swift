//
//  ViewController.swift
//  study3_2button
//
//  Created by 황유빈 on 4/12/24.
//

//Swift의 오토레이아웃을 사용할 때 어떻게 하면 두 개의 버튼이 화면의 가로 축을 따라 같은 간격으로 분배되도록 배치할 수 있을까? 이때 각 버튼은 화면의 가장자리로부터 동일한 여백을 유지

import UIKit
import SnapKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setButton()
    }
    
    //MARK: - Button
    private lazy var leftButton: UIButton = {
        let button1 = UIButton()
        button1.backgroundColor = .blue
        button1.setTitle("좌", for: .normal)
        return button1
    }()
    
    private lazy var rightButton: UIButton = {
        let button2 = UIButton()
        button2.backgroundColor = .red
        button2.setTitle("우", for: .normal)
        return button2
    }()
    
    
    private func setButton() {
        self.view.addSubview(leftButton)
        self.view.addSubview(rightButton)
        
        leftButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(100)
        }
        
        rightButton.snp.makeConstraints { make in
            make.centerY.equalTo(leftButton)
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-100)
        }
               

    }
}
    

