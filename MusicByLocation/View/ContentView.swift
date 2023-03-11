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
            if !findMusicPressed {
                VStack {
                    Section {
                        Image("MusicIcon")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .edgesIgnoringSafeArea(.all)
                    }
                    Section {
                        Text("Get the musician \n for your position!")
                            .font(.system(size: 30))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                }
            }
            else {
                let artistDictionary: [String: [StringTuple]] = state.artistDictionary
                List {
                    ForEach(artistDictionary.keys.sorted(), id: \.self) { genre in
                        Section(header: Text(genre)) {
                            ForEach(artistDictionary[genre]!) { artist in
                                Link(artist.first, destination: URL(string: artist.second) ?? URL(string: "https://itunes.apple.com/search?term=\(artist.first)&entity=musicArtist")!).foregroundColor(.black)
                            }
                        }
                    }
                }
                .navigationBarTitle("Artists")
            }
            
            Spacer()
            Button("Find Music", action: {
                state.findMusic()
                findMusicPressed = true
            })
        }
        .onAppear(perform: {
            state.requestAccessToLocationData()
        })
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
