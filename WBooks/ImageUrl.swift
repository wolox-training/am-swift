//
//  ImageUrl.swift
//  WBooks
//
//  Created by ana.mancuso on 12/10/2022.
//
import UIKit
let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {

    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            self.image = cachedImage
        }else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                      let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                      let data = data, error == nil,
                      let image = UIImage(data: data)
                        else {
                            return DispatchQueue.main.async() { [weak self] in
                                self?.image = UIImage(named: "defaultImage")
                            }
                        }
                    DispatchQueue.main.async() { [weak self] in
                    let imageToCache = UIImage(data: data)
                    imageCache.setObject(imageToCache!, forKey: url.absoluteString as NSString)
                    self?.image = image
                }
            }.resume()
        }
    }

    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else {
            return self.image = UIImage(named: "defaultImage")
        }
        downloaded(from: url, contentMode: mode)
    }
    
}
