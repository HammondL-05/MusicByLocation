//
//  LocationHandler.swift
//  MusicByLocation
//
//  Created by Leo Hammond on 02/03/2023.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate, ObservableObject {
    let manager = CLLocationManager()
    let geocoder = CLGeocoder()
    @Published var city: String = ""
    @Published var subCity: String = ""
    @Published var street: String = ""
    @Published var lastKnownLocation: String = ""
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestAuthorisation() {
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        manager.requestLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.lastKnownLocation = "Could not perofrm lookup of location from coordinate information"
                } else {
                    if let firstPlacemark = placemarks?[0] {
                        self.city = firstPlacemark.locality ?? "Couldn't find city"
                        self.subCity = firstPlacemark.subLocality ?? "Couldn't find sub city"
                        self.street = firstPlacemark.thoroughfare ?? "Couldn't find street"
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        lastKnownLocation = "Error finding location"
    }
}
