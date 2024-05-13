//
//  ViewController.swift
//  threadTest
//
//  Created by 황유빈 on 5/13/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var count1 = 100
    var count2 = 100
    
    // MARK: - Member
    private lazy var timer: UILabel = {
        let timer = UILabel()
        timer.text = "\(count1) : \(count2)"
        timer.textColor = .black
        timer.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        timer.textAlignment = .center
        return timer
    }()
    
    private lazy var button: UIButton = {
        var button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle(" Timer Start ", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button.addTarget(self, action: #selector(clickedButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(timer)
        self.view.addSubview(button)
        makeConstraints()
    }
    
    // MARK: - Configuration
    private func makeConstraints() {
        ///타이머 Label
        timer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.lessThanOrEqualTo(30)
            make.width.lessThanOrEqualTo(200)
        }
        
        ///버튼
        button.snp.makeConstraints { make in
            make.top.equalTo(timer.snp.bottom).offset(30)
            make.height.greaterThanOrEqualTo(30)
            make.width.lessThanOrEqualTo(200)
            make.centerX.equalToSuperview()
        }
    }
    
    
    // MARK: - Function
    @objc private func clickedButton() {
        //첫 번째 숫자 카운트 다운 (0.5초마다)
        DispatchQueue.global().async {
            while self.count1 > 0 {
                self.count1 -= 1
                Thread.sleep(forTimeInterval: 0.5)
                DispatchQueue.main.async {
                    self.timer.text = "\(self.count1) : \(self.count2)"
                }
            }
        }
                
        // 두 번째 카운트 다운 시작 (2초마다)
        DispatchQueue.global().async {
            while self.count2 > 0 {
                self.count2 -= 1
                Thread.sleep(forTimeInterval: 2)
                DispatchQueue.main.async {
                    self.timer.text = "\(self.count1) : \(self.count2)"
                }
            }
        }
    }
}

