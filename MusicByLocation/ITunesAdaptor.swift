//
//  ITunesAdaptor.swift
//  MusicByLocation
//
//  Created by Leo Hammond on 07/03/2023.
//

import Foundation

class ITunesAdaptor {
    
    func getArtists(search: String, completion: @escaping ([Artist]?) -> Void) {
        let baseURL = "https://itunes.apple.com"
        let path = "/search?term=\(search)&entity=musicArtist&limit=10".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: baseURL + path)
        else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJSON(json: data) {
                    completion(response.results)
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }
    
    func parseJSON(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Error Decoding JSON")
            return nil
        }
    }
}

