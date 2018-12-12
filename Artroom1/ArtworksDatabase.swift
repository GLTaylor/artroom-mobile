//
//  ArtworksDatabase.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 10/31/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation
import UIKit

// singleton class - one instance, can be used throughout app via 'shared', a way to access the same database and the same instance of it, the whole time.

public class ArtworksDatabase {
    static let shared = ArtworksDatabase()

    private(set) var arrayOfArtworks: [Artwork] // Because I only want to mutate it here but read it from the outside

    private init() {
        arrayOfArtworks = []
    }

    // added error and [Artwork]
    func load(completionHandler: @escaping ([Artwork]?, Error?) -> Void) {
        loadJson { artworks, error in

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

private func loadJson(completionHandler: @escaping ([Artwork]?, Error?) -> Void) {
    var task: URLSessionTask?
    let path = URL(string: "https://www.artroom.fun/artworks.json")
    task?.cancel()
    task = URLSession.shared.dataTask(with: path!) { data, _, error in
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
    task!.resume()
}
