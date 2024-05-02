//
//  ViewController.swift
//  gesturePractice_pinch_rotate
//
//  Created by 황유빈 on 5/2/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    private lazy var image: UIImageView = {
        let img = UIImageView()
        let image = UIImage(named: "image.png")
        img.image = image
        img.contentMode = .scaleAspectFit
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(sender:)))
        img.isUserInteractionEnabled = true // 이미지 뷰가 사용자 상호 작용을 받을 수 있도록 설정합니다.
        img.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(sender:)))
        img.addGestureRecognizer(rotateGesture)
        
        return img
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = .white
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        self.view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(300)
        }
    }
    
    @objc func handlePinch(sender: UIPinchGestureRecognizer) {
        
        if sender.state == .began || sender.state == .changed {
            image.transform = image.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1
        }
    }
    
    @objc func handleRotate(sender: UIRotationGestureRecognizer) {
        guard view != nil else { return }
        
        if sender.state == .began || sender.state == .changed {
            image.transform = image.transform.rotated(by: sender.rotation)
            sender.rotation = 10
        }
    }
}

