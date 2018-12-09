//
//  Interest.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 10/25/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation

enum Interest: Int, Codable {
    case tech
    case nature
    case humanity
    case sexuality
    case politics
    case death

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)

        switch string {
        case "Tech ", "Tech": self = .tech
        case "Nature", "Nature ": self = .nature
        case "Humanity", "Humanity ": self = .humanity
        case "Sexuality", "eroticism", "Sexuality ": self = .sexuality
        case "Politics", "politics", "Politics ": self = .politics
        case "Death", "death", "Death ": self = .death
        default: throw
            DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Unknown string found where a legitimate interest should be \(string) "))
        }
    }
}
