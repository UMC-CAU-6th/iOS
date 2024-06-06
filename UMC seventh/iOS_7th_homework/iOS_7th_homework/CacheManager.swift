//
//  CacheManager.swift
//  iOS_7th_homework
//
//  Created by 한지강 on 5/31/24.
//
import Foundation
import UIKit

class CacheManager {
    static let shared = CacheManager()
    private init() {}
    
    let cache = NSCache<NSString, UIImage>()
    
    func saveAndDownload(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = cache.object(forKey: urlString as NSString) {
            completion(cachedImage)
        } else {
            guard let url = URL(string: urlString) else {
                completion(nil)
                return
            }
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    self.cache.setObject(image, forKey: urlString as NSString)
                    completion(image)
                } else {
                    completion(nil)
                }
            }
            task.resume()
        }
    }
    
    func load(urlString: String) -> UIImage? {
        return cache.object(forKey: urlString as NSString)
    }
}
