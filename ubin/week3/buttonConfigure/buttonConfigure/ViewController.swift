//
//  ViewController.swift
//  buttonConfigure
//
//  Created by 황유빈 on 4/30/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - Button
    ///Button1
    private lazy var btn1: UIButton = {
        
        /* 버튼1 Configuration */
        var config = UIButton.Configuration.filled()
        
        var title = AttributeContainer()
        title.font = UIFont.boldSystemFont(ofSize: 20)
        
        config.attributedTitle = AttributedString("Start", attributes: title)
        config.image = UIImage(named: "start.png")
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 30)
        config.imagePadding = 10
        
        config.titleAlignment = .leading
        let btn1 = UIButton(configuration: config)
        
        /* 버튼 액션 */
        btn1.addTarget(self, action: #selector(clikedButton1), for: .touchUpInside)
        
        return btn1
    }()
    
    ///button2
    private lazy var btn2: UIButton = {
        let btn2 = UIButton()
        
        /* 버튼2 Configuration */
        var config = UIButton.Configuration.filled()
        
        var title = AttributeContainer()
        title.font = UIFont.boldSystemFont(ofSize: 30)
        
        config.attributedTitle = AttributedString("Stop!", attributes: title)
        btn2.configuration = config
        
        return btn2
    }()
    
    //MARK: - Stack
    private lazy var buttonStack: UIStackView = {
        let btnStack = UIStackView()
        btnStack.axis = .horizontal
        btnStack.alignment = .center
        btnStack.spacing = 20
        return btnStack
    }()
    
    //MARK: - INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        addStackProperty()
        setButton()
    }
    
    //MARK: - Constraints
    ///프로퍼티 뷰 추가
    private func addStackProperty() {
        buttonStack.addArrangedSubview(btn1)
        buttonStack.addArrangedSubview(btn2)
        
        self.view.addSubview(buttonStack)
    }
    
    private func setButton() {
        
        buttonStack.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
            
            btn1.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
            }
            
            btn2.snp.makeConstraints { make in
                make.centerY.equalTo(btn1)
            }
    }
    
    // MARK: - BtnAction
    ///버튼1 액션
    @objc private func clikedButton1() {
        let alert = UIAlertController(title: "Play", message: "영상을 재생할까요? \n Start/Stop", preferredStyle: .alert)
        
        let start = UIAlertAction(title: "Start", style: .default) { _ in
            print("알림창 확인 누름")
        }
        let stop = UIAlertAction(title: "Stop", style: .default)
        
        alert.addAction(start)
        alert.addAction(stop)
        
        self.present(alert, animated: true, completion: nil)
    }
}

