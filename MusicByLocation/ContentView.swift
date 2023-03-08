//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Leo Hammond on 02/03/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var state = StateController()
    @State var findMusicPressed = false
    
    var body: some View {
        VStack {
            List {
//                ForEach(Array(state.artistDict.keys).sorted(by: <), id: \.self) { key in
//                    Section(header: Text(key)) {
//                        ForEach((state.artistDict[key] ?? [""])) { value in
//                            Button(value, action: {
//
//                            })
//                        }
//                    }
//                }
                ForEach(Array(state.artistNames), id: \.self) { artist in
                    if artist.first != "" {
                        Link(artist.first, destination: URL(string: artist.second) ?? URL(string: "https://itunes.apple.com/search?term=\(artist.first)&entity=musicArtist")!)
                            .foregroundColor(.black)
                            
                    }
                    else if findMusicPressed == true && artist.first == "" {
                        HStack {
                            Text("Loading...")
                            Spacer()
                            ProgressView().progressViewStyle(CircularProgressViewStyle())
                        }
                    }
                    else {
                        Text("Press Find Music to start your search...")
                    }
                }
            }
            Spacer()
            Button("Find Music", action: {
                state.findMusic()
                findMusicPressed = true
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
