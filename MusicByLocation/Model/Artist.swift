//
//  Artists.swift
//  MusicByLocation
//
//  Created by Leo Hammond on 03/03/2023.
//

import Foundation

struct Artist: Codable {
    var name: String
    var genre: String?
    var link: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "artistName"
        case genre = "primaryGenreName"
        case link = "artistLinkUrl"
    }
}
