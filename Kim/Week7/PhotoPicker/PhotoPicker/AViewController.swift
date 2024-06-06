//
//  ViewController.swift
//  PhotoPicker
//
//  Created by 김나연 on 6/1/24.
//

import UIKit
import SnapKit

class AViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    private let albumView = AlbumView(tabName: "A탭")
    private var photoPickerManager: PhotoPickerManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupView()
        photoPickerManager = PhotoPickerManager(viewController: self, imageView: albumView.imageView)
        albumView.albumButton.addTarget(self, action: #selector(openAlbum), for: .touchUpInside)
    }
    private func setupView(){
        view.addSubview(albumView)
        albumView.snp.makeConstraints{ make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    @objc private func openAlbum(){
        photoPickerManager?.presentPhotoPicker()
    }
}

