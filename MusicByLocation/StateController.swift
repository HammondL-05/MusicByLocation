//
//  StateController.swift
//  MusicByLocation
//
//  Created by Leo Hammond on 03/03/2023.
//

import Foundation

class StateController: ObservableObject, Identifiable {
    let locationHandler: LocationHandler = LocationHandler()
    let iTunesAdaptor = ITunesAdaptor()
    @Published var artistNames: [String] = []
    @Published var artistDict: [String: String] = [:]
    var lastKnownLocation: String = "" {
        didSet {
            iTunesAdaptor.getArtists(search: lastKnownLocation, completion: updateArtistsViaLocation)
        }
    }
    
    
    func findMusic() {
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func updateArtistsViaLocation(artists: [Artist]?) {
        let simpleNames = artists?.map { return $0.name + ", " + $0.genre ?? "No genre"}
        DispatchQueue.main.async {
            self.artistNames = simpleNames ?? ["No Artists"]
        }
        
//        let names: [(String, String)] = artists?.map { return ($0.genre ?? "", $0.name)} as? [(String, String)]
//        for artist in names {
//            if self.artistDict.keys.isEmpty == true {
//                self.artistDict[artist.0] = artist.1
//            }
//            for key in self.artistDict.keys {
//                if artist.0 == key {
//                    self.artistDict[key]?.append(artist.1)
//                }
//                else {
//                    self.artistDict[artist.0] = artist.1
//                }
//            }
//        }
    }
}



