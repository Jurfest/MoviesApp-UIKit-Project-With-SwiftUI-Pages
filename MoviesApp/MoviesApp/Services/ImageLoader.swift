//
//  ImageLoader.swift
//  MoviesApp
//
//  Created by Diego Jurfest Ceccon on 17/08/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    
    var downloadedImage: UIImage?
    let didChange = PassthroughSubject<ImageLoader?, Never>()
    
    func load(url: String) {
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct.")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.didChange.send(nil)
                }
                return
            }
            
            let img = UIImage(data: data)
            self.downloadedImage = img
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
           
            
            
        }.resume()
    }
}
