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
    var arrayOfArtworks: [Artwork]
    
    private init() {
        arrayOfArtworks = []
    }
    // added error and [Artwork]
    func load(completionHandler: @escaping ([Artwork]?, Error?) -> Void ) {
        loadJson { (artworks, error) in
            if let artworks = artworks {
                self.arrayOfArtworks = artworks
                completionHandler(artworks, nil)
            } else {
                print(error.debugDescription)
                completionHandler(nil, error)
            }
        }
    }
}

private func loadJson(completionHandler: @escaping ([Artwork]?,Error?) -> Void) {
    let path = URL(string:"https://www.artroom.fun/artworks.json")
    let task = URLSession.shared.dataTask(with: path!) { (data, response, error) in
        DispatchQueue.main.async {
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
    }
    task.resume()
}
