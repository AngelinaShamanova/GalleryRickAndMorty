//
//  UIViewController + Extension.swift
//  GalleryRickAndMorty
//
//  Created by Angelina on 14.02.2021.
//

import UIKit

extension UIView {
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }

    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImage(withUrl urlString : String, whiteColored: Bool = false, onDownloaded: ((UIImage)->Void)? = nil) {
        let url = URL(string: urlString)
        if url == nil {return}
        self.image = nil
        // Check if image in cache
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }
        
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .medium)
        addSubview(activityIndicator)
        activityIndicator.center = CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2)
        activityIndicator.startAnimating()
        
        // Download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    onDownloaded?(image)
                    activityIndicator.stopAnimating()
                    activityIndicator.removeFromSuperview()
                    if whiteColored {
                        self.image = self.image?.withRenderingMode(.alwaysTemplate)
                        self.tintColor = UIColor(named: "customBackground")
                    }
                }
            }
        }).resume()
    }
}
