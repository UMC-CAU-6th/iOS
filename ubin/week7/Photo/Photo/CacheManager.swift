//
//  CacheManager.swift
//  Photo
//
//  Created by 황유빈 on 6/1/24.
//

import UIKit

class CacheManager {
    static let shared = CacheManager()
    private init() {}

    private let cache = NSCache<NSString, UIImage>()
    private let fileManager = FileManager.default
    private let cacheDirectory: URL = {
        let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return urls[0]
    }()
    
    func saveAndDownload(imageUrl: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = load(imageUrl: imageUrl) {
            completion(cachedImage)
            return
        }
        
        guard let url = URL(string: imageUrl) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data), error == nil else {
                completion(nil)
                return
            }
            
            self.cacheImage(image, forKey: imageUrl)
            completion(image)
        }
        task.resume()
    }
    
    func load(imageUrl: String) -> UIImage? {
        if let cachedImage = cache.object(forKey: imageUrl as NSString) {
            return cachedImage
        }
        
        let fileUrl = cacheDirectory.appendingPathComponent((imageUrl as NSString).lastPathComponent)
        if let image = UIImage(contentsOfFile: fileUrl.path) {
            cache.setObject(image, forKey: imageUrl as NSString)
            return image
        }
        
        return nil
    }
    
    private func cacheImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
        
        let fileUrl = cacheDirectory.appendingPathComponent((key as NSString).lastPathComponent)
        if let data = image.pngData() {
            try? data.write(to: fileUrl)
        }
    }
}
