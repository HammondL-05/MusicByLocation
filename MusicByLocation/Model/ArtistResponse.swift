//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Leo Hammond on 03/03/2023.
//

import Foundation

struct ArtistResponse: Codable {
    var resultCount: Int
    var results: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case resultCount = "resultCount"
        case results = "results"
    }
}
