//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Leo Hammond on 02/03/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var state = StateController()
    
    var body: some View {
        VStack {
            List {
                ForEach(state.artistNames) { name in
                    Text(name)
                }
            }
            Spacer()
            Button("Find Music", action: {
                state.findMusic()
            })
        }.onAppear(perform: {
            state.requestAccessToLocationData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
