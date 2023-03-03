//
//  CLPlacemark.swift
//  MusicByLocation
//
//  Created by Leo Hammond on 03/03/2023.
//

import Foundation
import CoreLocation

extension CLPlacemark {
    func getLocationBreakdown() -> String {
        return """
                 Country: \(self.country ?? "Couldn't find country")
                 City: \(self.locality ?? "Couldn't find city")
                 Sub City: \(self.subLocality ?? "Couldn't find city")
                 Street: \(self.thoroughfare ?? "Couldn't find street")
                 """
    }
}
