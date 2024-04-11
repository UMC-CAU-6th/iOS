//
//  ViewController.swift
//  DonutApp
//
//  Created by 김나연 on 4/11/24.
//

import UIKit
import SnapKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setTitle()
    }
    //초기화를 지연시키기 위해 lazy 키워드 사용, 필요한 시점에 초기화 가능
    private lazy var titleName: UILabel = {
        let title = UILabel()
        title.text = "Donut"
        title.textColor = .systemPink
        return title
    }()
    
    private func setTitle(){
        self.view.addSubview(titleName)
        titleName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleName.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleName.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

