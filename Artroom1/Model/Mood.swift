//
//  Mood.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 10/25/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation

enum Mood: Int, Comparable, Codable {
    static func < (lhs: Mood, rhs: Mood) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    case joyful
    case melancholy
    case meh
    case wild
    case poetic
    case humorous

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        var string = try container.decode(String.self)
        string = string.lowercased().trimmingCharacters(in: .whitespaces)

        switch string {
        case "joyful": self = .joyful
        case "melancholy": self = .melancholy
        case "meh": self = .meh
        case "wild": self = .wild
        case "poetic": self = .poetic
        case "humorous": self = .humorous
        default: throw
            DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Unknown mood string found: \(string)"))

        }
    }
}
