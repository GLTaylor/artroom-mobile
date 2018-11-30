//
//  Mood.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 10/25/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation

enum Mood: Int, Codable {
    case joyful 
    case melancholy
    case meh
    case wild
    case poetic
    case humorous
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        
        switch string {
        case "Joyful", "Joyful ": self = .joyful
        case "Melancholy ", "Melancholy", "melancholy": self = .melancholy
        case "Meh", "Meh ", "meh": self = .meh
        case "Wild", "wild", "Wild ": self = .wild
        case "Poetic", "poetic", "Poetic ": self = .poetic
        case "Humorous", "Humorous ": self = .humorous
        default: throw
            DecodingError.dataCorrupted(DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Unknown string found where a legitimate mood should be \(string)"))
        }
    }
}


