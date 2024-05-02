//
//  ViewController.swift
//  gesturePractice
//
//  Created by 황유빈 on 4/30/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var textField: UITextField = {
        let text = UITextField()
        text.borderStyle = .roundedRect
        text.autocorrectionType = .no
        text.clearButtonMode = .whileEditing
        text.returnKeyType = .done
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecognizer:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        return text
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.view.backgroundColor = .white
        
        
        
        makeConstraints()
    }
    
    //MARK: - ConstrintsFuction
    private func makeConstraints() {
        self.view.addSubview(textField)
        
        textField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
    }
    

    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
        self.view.endEditing(true)
    }

}

