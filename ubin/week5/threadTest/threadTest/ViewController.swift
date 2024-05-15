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
        
        
        /*버튼 Configuration*/
        var btnConfig = UIButton.Configuration.filled()
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        btnConfig.attributedTitle = AttributedString(" Timer Start ", attributes:titleContainer)
        btnConfig.baseBackgroundColor = .systemBlue
        btnConfig.background.cornerRadius = 47
        btnConfig.baseForegroundColor = .white
      
        button.configuration = btnConfig
        
        button.addTarget(self, action: #selector(clickedButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var backView: UIView = {
        let backView = UIView()
        backView.layer.shadowColor = UIColor.gray.cgColor
        backView.layer.shadowOffset = .zero
        backView.layer.shadowRadius = 10
        backView.layer.shadowOpacity = 0.9
        return backView
    }()
    
    private lazy var innerView: CustomView = {
        let backView = CustomView()
        backView.backgroundColor = .white
        return backView
    }()
    
    private lazy var orangeView: CustomView = {
        let backView = CustomView()
        backView.backgroundColor = .orange
        return backView
    }()
    
    private lazy var redView: CustomView = {
        let backView = CustomView()
        backView.backgroundColor = .red
        return backView
    }()
    
    // MARK: - Segmented Control
    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["normal", "orange", "red"])
        control.backgroundColor = UIColor.gray
        control.tintColor = UIColor.white
        
        control.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        
        return control
      }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        segmentbtn()
    }
    
    // MARK: - Configuration
    
    private func changeView(_ idx: Int) {
        switch idx {
        case 0:
            makeConstraints(view: innerView)
        case 1:
            makeConstraints(view: orangeView)
        case 2:
            makeConstraints(view: redView)
        default:
            return self.view.backgroundColor = .white
        }
    }
    
    private func segmentbtn() {
        self.view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.height.lessThanOrEqualTo(40)
            make.width.lessThanOrEqualTo(300)
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
        }
    }
    
    private func makeConstraints(view: UIView) {
        self.view.addSubview(backView)
        self.backView.addSubview(view)
        self.view.addSubview(timer)
        self.view.addSubview(button)
        self.view.bringSubviewToFront(timer)
        self.view.bringSubviewToFront(button)
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
        
        ///뒤에 뷰
        backView.snp.makeConstraints { make in
            make.height.equalTo(300)
            make.width.equalTo(300)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        ///이너 뷰
        view.snp.makeConstraints { make in
            make.height.equalTo(300)
            make.width.equalTo(300)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
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

    @objc private func segmentChanged(segment: UISegmentedControl) {
        changeView(segment.selectedSegmentIndex)
    }
}

