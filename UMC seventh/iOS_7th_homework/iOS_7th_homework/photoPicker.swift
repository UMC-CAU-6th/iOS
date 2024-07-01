//
//  photoPicker.swift
//  iOS_7th_homework
//
//  Created by 한지강 on 5/27/24.
//
import UIKit
import PhotosUI

protocol PhotoPickerDelegate: AnyObject {
    func didSelectImage(_ image: UIImage)
}

class PhotoPicker: NSObject, PHPickerViewControllerDelegate {
    weak var delegate: PhotoPickerDelegate?

    func presentPhotoPicker(from viewController: UIViewController) {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images

        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        viewController.present(picker, animated: true, completion: nil)
    }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)

        guard let provider = results.first?.itemProvider else { return }

        if provider.canLoadObject(ofClass: UIImage.self) {
            provider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                DispatchQueue.main.async {
                    if let image = image as? UIImage {
                        self?.delegate?.didSelectImage(image)
                    }
                }
            }
        }
    }
}

    /*
     OOP 객체지향언어
     2004년
     
     1. 캡슐화
     2. 다형성
     3. 상속
     
     -> 재사용, 분리서
     
     단일 책임 -> 하나의 함수, 하나 클래스 등등 하나의 xx -> 그것만 구현해라
     포토 피커 -> 포토피커 기능
     
     자바 -> 인터페이스 추상화 파일 -> 상속을 다형성을 가지도록 클래스에 상속이 되면서 캡슐화가 되도록 하기 위함
     swift  '인터페이스' -> protocol
     */
