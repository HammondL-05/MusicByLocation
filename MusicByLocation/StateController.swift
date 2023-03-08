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
    @Published var artistNames: [StringTuple] = [StringTuple("", "")]
    @Published var artistDict: [String: [String]] = [:]
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
        let names = artists?.map { return ($0.name + ", " + ($0.genre ?? "No genre"), $0.link ?? "No link") }
        
        var namesTuples: [StringTuple] = []
        
        for name in names ?? [] {
            namesTuples.append(StringTuple(name.0, name.1))
        }

        DispatchQueue.main.sync {
            self.artistNames = namesTuples
        }
//        DispatchQueue.main.async {
//            self.artistNames = simpleNames ?? ["No Artists"]
//        }
//        let names: [(String, String)] = artists?.map { return (($0.genre ?? "No Genre"), $0.name)} ?? [("No value","No value")]
//        var artistDictionary: [String: [String]] = [:]
//        for genre in names {
//            if artistDictionary.keys.isEmpty == true {
//                artistDictionary[genre.0] = [genre.1]
//            }
//            for key in artistDictionary.keys {
//                print(key)
//                print(genre.0)
//                if genre.0 == key {
//                    artistDictionary[key]?.append(genre.1)
//                }
//                else {
//                    artistDictionary[genre.0] = [genre.1]
//                }
//            }
//        }
//        DispatchQueue.main.sync {self.artistDict = artistDictionary}
    }
}



