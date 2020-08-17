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
    
    @Published var downloadedData: Data?
    
    // var downloadedImage: UIImage?
    // let didChange = PassthroughSubject<ImageLoader?, Never>()
    
    func downloadImage(url: String) {
        
        guard let imageURL = URL(string: url) else {
            // fatalError("ImageURL is not correct.")
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            guard let data = data, error == nil else {
                // DispatchQueue.main.async {
                    // self.didChange.send(nil)
                // }
                return
            }
            
//            let img = UIImage(data: data)
//            self.downloadedImage = img
            DispatchQueue.main.async {
                self.downloadedData = data
            }
           
            
            
        }.resume()
    }
}
