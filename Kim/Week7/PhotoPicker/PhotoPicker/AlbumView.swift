//
//  AlbumView.swift
//  PhotoPicker
//
//  Created by 김나연 on 6/1/24.
//

import UIKit
import SnapKit

class AlbumView: UIView {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = false
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let albumButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    init(tabName: String){
        super.init(frame: .zero)
        albumButton.setTitle("\(tabName) 앨범 부르기..", for: .normal)
        setupView()
    }
    required init?(coder: NSCoder){
        super.init(coder: coder)
        setupView()
    }
    private func setupView(){
        addSubview(imageView)
        addSubview(albumButton)
        imageView.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(imageView.snp.width)
        }
        albumButton.snp.makeConstraints{ make in
            make.top.equalTo(imageView.snp.bottom).offset(50)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(40)
        }
    }
}
