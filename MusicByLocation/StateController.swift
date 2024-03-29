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
    @Published var buttonPressed = false
    @Published var isLoading = false
    var lastKnownLocation: String = "" {
        didSet {
            iTunesAdaptor.getArtists(search: lastKnownLocation, completion: updateArtistsViaLocation)
        }
    }
    @Published var artistDictionary = [String: [StringTuple]]()
    
    
    func findMusic() {
        locationHandler.requestLocation()
        
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func updateArtistsViaLocation(artists: [Artist]?) {
        if let names = artists?.map({ return (($0.genre ?? "No genre"), $0.name, $0.link ?? "No link") }) {
            for artist in names {
                let genre = artist.0
                let tuple = StringTuple(artist.1, artist.2)
                
                DispatchQueue.main.async {
                    if let existingValues = self.artistDictionary[genre] {
                        self.artistDictionary[genre] = existingValues + [tuple]
                    } else {
                        self.artistDictionary[genre] = [tuple]
                    }
                    self.isLoading = false
                }
            }
        }
    }
}



