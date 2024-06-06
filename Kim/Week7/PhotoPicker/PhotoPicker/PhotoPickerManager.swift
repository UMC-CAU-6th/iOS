//
//  PhotoPickerManager.swift
//  PhotoPicker
//
//  Created by 김나연 on 6/1/24.
//

import UIKit
import PhotosUI

class PhotoPickerManager: NSObject, PHPickerViewControllerDelegate {
    private weak var viewController: UIViewController?
    private let imageView: UIImageView
    init(viewController: UIViewController, imageView: UIImageView){
        self.viewController = viewController
        self.imageView = imageView
    }
    func presentPhotoPicker(){
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        viewController?.present(picker, animated: true, completion: nil)
    }
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        guard let result = results.first else {return}
        result.itemProvider.loadObject(ofClass: UIImage.self){ [weak self] object, error in
            guard let self = self else {return}
            if let image = object as? UIImage{
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
    }
}
