//
//  ViewController.swift
//  PACKAGE
//
//  Created by 한지강 on 2024/04/11.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let box = UIView()
    let redBox = UIView()
    
    private lazy var titleName: UILabel = {
        let title = UILabel()
        title.text = "연습입니다!!"
        title.textColor = .white
        return title
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        redBox.backgroundColor = .red
        self.view.addSubview(redBox)
        
        
        redBox.snp.makeConstraints { make in
            make.bottom.left.right.top.equalToSuperview()
        }
        
        self.view.addSubview(titleName)
        
        titleName.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        
    }
    
    
}
