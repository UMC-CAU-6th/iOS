//
//  ViewController.swift
//  GestureandButton
//
//  Created by 김나연 on 5/2/24.
//

import UIKit
import SnapKit

///여기서 UIScrollViewDelegate 이거 왜하는지 모르겠음
class ViewController: UIViewController {
    
    private lazy var titleL: UILabel = {
        var t = UILabel()
        t.font = UIFont.systemFont(ofSize: 30)
        t.text = "숙제"
        /*숙제를 클릭하면 키보드 내려감*/
        t.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(hidekeyboard))
        t.addGestureRecognizer(tap)
        return t
    }()
    
    //MARK: - a 텍스트필드
    private lazy var aTF: UITextField = {
        var tf = UITextField()
        tf.frame.size.width = 338
        tf.frame.size.height = 45
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.backgroundColor = .gray
        tf.textColor = .white
        return tf
    }()
    
    //MARK: - b 이미지 확대 축소
    private lazy var img: UIImageView = {
        var i = UIImageView()
        i.image = UIImage(named: "apple")
        i.isUserInteractionEnabled = true
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        i.addGestureRecognizer(pinchGesture)
        return i
    }()
    
    //MARK: - c 이미지 회전
    private lazy var logo: UIImageView = {
        var i = UIImageView()
        i.image = UIImage(named: "ios")
        i.isUserInteractionEnabled = true
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotation(_:)))
        i.addGestureRecognizer(rotationGesture)
        return i
    }()
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        view.addSubview(titleL)
        titleL.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalToSuperview()
        }
        
        ///a init
        view.addSubview(aTF)
        aTF.snp.makeConstraints { make in
            make.top.equalTo(titleL.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(338)
            make.height.equalTo(45)
        }
        
        ///b init
        view.addSubview(img)
        img.snp.makeConstraints { make in
            make.top.equalTo(aTF.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(400)
        }
        
        ///c init
        view.addSubview(logo)
        logo.snp.makeConstraints { make in
            make.top.equalTo(img.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(300)
            make.width.equalTo(300)
        }
    }
    
    //MARK: - A Function
    @objc private func hidekeyboard(){
        view.endEditing(true)
    }
    
    //MARK: - B Function
    ///@objc랑 @IBAction을 왜 쓰는지 잘 모르겠다..
    @objc private func handlePinch(_ gestureRecognizer: UIPinchGestureRecognizer) {
        guard let view = gestureRecognizer.view else { return }
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            view.transform = view.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale)
            gestureRecognizer.scale = 1.0
        }
    }
    
    //MARK: - C Function
    @objc private func rotation(_ gestureRecognizer: UIRotationGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view?.transform = gestureRecognizer.view!.transform.rotated(by: gestureRecognizer.rotation)
            gestureRecognizer.rotation = 0
        }
    }
}

