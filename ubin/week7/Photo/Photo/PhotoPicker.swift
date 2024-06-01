//
//  phoViewController.swift
//  Photo
//
//  Created by 황유빈 on 5/31/24.
//

import UIKit
import PhotosUI

protocol PhotoPickerProtocol: PHPickerViewControllerDelegate {
    func presentPhotoPicker()
    func didSelectPhoto(image: UIImage)
}

extension PhotoPickerProtocol where Self: UIViewController {
    func presentPhotoPicker() {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.selectionLimit = 1
        configuration.filter = .images

        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        guard let result = results.first else { return }

        result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (object, error) in
            if let image = object as? UIImage {
                DispatchQueue.main.async {
                    self?.didSelectPhoto(image: image)
                }
            }
        }
    }
}
