//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Leo Hammond on 02/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationHandler = LocationHandler()
    
    var body: some View {
        VStack {
            Text("""
                 City: \(locationHandler.city)
                 Sub City: \(locationHandler.subCity)
                 Street: \(locationHandler.street)
                 """)
                .padding()
            Spacer()
            Button("Find Music", action: {
                locationHandler.requestLocation()
            })
        }.onAppear(perform: {
            locationHandler.requestAuthorisation()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
