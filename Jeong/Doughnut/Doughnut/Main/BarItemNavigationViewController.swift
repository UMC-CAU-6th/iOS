//
//  BarItemNavigationViewController.swift
//  Doughnut
//
//  Created by 정의찬 on 5/8/24.
//

import UIKit
import SnapKit

class BarItemNavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .yellow
        
        makeConstraints()
    }
    
    // MARK: - 예비 버튼(추후 과제에서 다시 변경할 예정)
    
    private lazy var closeButton: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(closedView), for: .touchUpInside)
        btn.setTitle("화면 닫기", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.pretendard(size: 18, weight: .bold)
        return btn
    }()
    
    @objc func closedView() {
        dismiss(animated: true)
    }
    
    private func makeConstraints() {
        self.view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(130)
            make.width.equalTo(200)
        }
    }
    
}
