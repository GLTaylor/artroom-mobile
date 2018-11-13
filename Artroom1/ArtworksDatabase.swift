//
//  ArtPieceDB.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 10/31/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation
import UIKit

// this is supposed to be my handy singleton class

public class ArtworksDatabase {
    static let shared = ArtworksDatabase()

    // internet said to make this a let variable, but then I couldn't populate it with json in the function, so it had to be var.
    var arrayOfArtworks: [Artwork]?
    
    private init() {}
    
        func apply() {
    
            func loadJson(_ fileName: String) -> [Artwork]? {
                if let path = Bundle.main.path(forResource: "data", ofType: "json") {
                    do {
                        let data = try Data(contentsOf: URL(fileURLWithPath: path))
                        let decoder = JSONDecoder()
                        let jsonData = try decoder.decode(ResponseData.self, from: data)
                        return jsonData.artwork
                    } catch {
                        print("error:\(error)")
                    }
                }
                return nil
            }
            
            arrayOfArtworks = loadJson("data")!
        }
}
