//
//  BaseViewController.swift
//  iOS_7th_homework
//
//  Created by 한지강 on 5/29/24.
//
//
//  BaseViewController.swift
//  iOS_7th_homework
//
//  Created by 한지강 on 5/29/24.
//
import UIKit
import SnapKit

class BaseViewController: UIViewController, PhotoPickerDelegate {
    
    public lazy var selectImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        return imageView
    }()
    
    public lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(presentPhotoPicker), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()
  

    func makeConstraints() {
        selectImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.4)
        }

        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(selectImage.snp.bottom).offset(20)
        }
    }

    @objc func presentPhotoPicker() {
        photoPicker.presentPhotoPicker(from: self)
        photoPicker.presentPhotoPicker(from: self)
    }

    func didSelectImage(_ image: UIImage) {
        selectImage.image = image
    }
    
    let photoPicker = PhotoPicker()

    var buttonTitle: String? {
        didSet {
            button.setTitle(buttonTitle, for: .normal)
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoPicker.delegate = self
        view.backgroundColor = .white
        makeConstraints()
    }
}
