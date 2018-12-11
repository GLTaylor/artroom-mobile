//
//  Interest.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 10/25/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation

enum Interest: Int, Comparable, Codable {
    static func < (lhs: Interest, rhs: Interest) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

    case tech
    case nature
    case humanity
    case sexuality
    case politics
    case death

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
<<<<<<< HEAD
        var string = try container.decode(String.self)
        string = string.lowercased().trimmingCharacters(in: .whitespaces)
=======
        let string = try container.decode(String.self)
>>>>>>> external-JSON

        switch string {
        case "tech": self = .tech
        case "nature": self = .nature
        case "humanity": self = .humanity
        case "sexuality", "eroticism": self = .sexuality
        case "politics": self = .politics
        case "death": self = .death
        default: throw
<<<<<<< HEAD
            DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Unknown interest string found: \(string) "))
=======
            DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Unknown string found where a legitimate interest should be \(string) "))
>>>>>>> external-JSON
        }
    }
}
