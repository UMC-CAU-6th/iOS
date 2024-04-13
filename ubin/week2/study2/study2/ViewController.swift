//
//  ViewController.swift
//  Created by 황유빈 on 4/11/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        setTitle()
    }

    private lazy var titleName: UILabel = {
        let title = UILabel()
        title.text = "연습입니다!!"
        title.textColor = .white
        return title
    }()

    private func setTitle() {
        self.view.addSubview(titleName)
        titleName.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}

