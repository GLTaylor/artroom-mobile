//
//  Artwork.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 10/25/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation

struct Artwork: Equatable, Decodable {
    let title: String
    let image: Image
    let attributes: ArtAttributes
    let artist: Artist

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let mood = try container.decode(Mood.self, forKey: .mood)
        let interest = try container.decode(Interest.self, forKey: .interest)
        attributes = ArtAttributes(mood: mood, interest: interest)
        title = try container.decode(String.self, forKey: .title)
        image = try container.decode(Image.self, forKey: .image)
        artist = try container.decode(Artist.self, forKey: .artist)
    }

    enum CodingKeys: String, CodingKey {
        case title
        case image
        case mood
        case interest
        case artist
    }

    // to handle the fact that my new JSON will have Image { url: String } and Artist { name: String }
    struct Image: Equatable, Codable {
        let url: String
    }

    struct Artist: Equatable, Codable {
        let name: String
    }
}
