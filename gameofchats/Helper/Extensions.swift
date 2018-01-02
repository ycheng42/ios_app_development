//
//  Extensions.swift
//  gameofchats
//
//  Created by Terry Cheng on 1/1/18.
//  Copyright © 2018 Terry Cheng. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadImageUsingCacheWithUrlString(urlString : String){
        
        self.image = nil
        
        //check cache for image first
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
            
        //otherwise fire off a new download
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, err) in
            
            // download hit an error so lets return out
            if err != nil {
                print("Failed to fetch profile image", err)
                return
            }
            
            DispatchQueue.main.async() {
                
                if let downloadImage = UIImage(data : data!){
                    imageCache.setObject(downloadImage, forKey: urlString as AnyObject)
                    self.image = UIImage(data: data!)
                }
            }
            
        }).resume()
    }
}
