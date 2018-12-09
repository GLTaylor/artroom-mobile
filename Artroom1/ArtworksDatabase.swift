//
//  ArtworksDatabase.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 10/31/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation
import UIKit

// this is my handy singleton class

public class ArtworksDatabase {
    static let shared = ArtworksDatabase()
    private(set) var arrayOfArtworks: [Artwork] // Because I only want to mutate it here but read it from the outside
    private(set) var dictOfImages: [String : UIImage]


    private init() {
        arrayOfArtworks = []
        dictOfImages = [:]
    }

    func load(completionHandler: @escaping () -> Void) {
        loadJson { artworks, _ in
            if let artworks = artworks {
                self.arrayOfArtworks = artworks
                // In Progress: The following is supposed to create a dictionary of images, to get them ready for use later instead of making new network requests. 
                artworks.forEach({ (artwork) in
                    let imageName = artwork.title
                    let imageLink = artwork.image.url
                    let url = URL(string: imageLink)
                    let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                        guard let data = data else {
                            print("location is nil: \(error)")
                            return
                        }
                        guard let image = UIImage(data: data) else {
                            print("The error is: \(error)")
                            return
                        }
                        DispatchQueue.main.async {
                            self.dictOfImages.updateValue(image, forKey: imageName)
                        }
                    })
                    task.resume()
                    
            })
                completionHandler()
            } else {
                // TODO: handle this error
            }
            print("the artworks are: \(self.arrayOfArtworks)")
            print("the images are: \(self.dictOfImages)")

        }
    }
}

private func loadJson(completionHandler: @escaping ([Artwork]?, Error?) -> Void) {
    let path = URL(string: "https://www.artroom.fun/artworks.json")
    let task = URLSession.shared.dataTask(with: path!) { data, _, error in
        guard let data = data else {
            completionHandler(nil, error)
            return
        }
        let decoder = JSONDecoder()
        do {
            let artworks = try decoder.decode([Artwork].self, from: data)
            completionHandler(artworks, nil)
        } catch {
            completionHandler(nil, error)
        }
    }
    task.resume()
}
