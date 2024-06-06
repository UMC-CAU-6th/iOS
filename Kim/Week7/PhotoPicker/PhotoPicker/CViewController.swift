//
//  CViewController.swift
//  PhotoPicker
//
//  Created by 김나연 on 6/1/24.
//
//TODO: - Save와 Load 분리하기 그리고 프로토콜 만들기
import UIKit

class CViewController: UIViewController {
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = false
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.snp.makeConstraints{make in
            //make.edges.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(imageView.snp.width)
        }
        let imgUrl = "https://image.msscdn.net/images/goods_img/20231006/3610962/3610962_17132312984287_500.jpg"
        guard let imageURL = URL(string: imgUrl) else {return}
        saveAndDownload(from: imageURL)
    }
    private func saveAndDownload(from url: URL){
        let cache = URLCache.shared
        let request = URLRequest(url: url)
        if let cachedResponse = cache.cachedResponse(for: request){
            print("Image is already cached")
            self.imageView.image = UIImage(data: cachedResponse.data)
            return
        }
        URLSession.shared.dataTask(with: request){data, response, error in
            guard let data = data, let response = response, error == nil else{
                print("Failed to load image")
                return
            }
            let cachedData = CachedURLResponse(response: response, data: data)
            cache.storeCachedResponse(cachedData, for: request)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }.resume()
    }
}
