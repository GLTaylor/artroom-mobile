//
//  ResponseData.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 11/2/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation

//note: I have all the items in the json put into one "artwork" array of items. It's not like this in the live API so when we make the URL call, this will need to be accounted for.

struct ResponseData: Codable {
    var artwork: [Artwork]
    
    enum CodingKeys: String, CodingKey {
      case artwork
    }
}
