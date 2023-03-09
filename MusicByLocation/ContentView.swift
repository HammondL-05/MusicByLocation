//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Leo Hammond on 02/03/2023.
//

import SwiftUI

//struct ContentView: View {
//    @ObservedObject private var state = StateController()
//    @State var findMusicPressed = false
//    @State var countdownSeconds = 3
//    @State var timer: Timer?
//
//    var body: some View {
//        VStack {
//            let artistDictionary: [String: [StringTuple]] = state.artistDictionary
//            List {
//                ForEach(artistDictionary.keys.sorted(), id: \.self) { genre in
//                    if countdownSeconds > 0 {
//                        HStack {
//                            Text("Loading...")
//                            Spacer()
//                            ProgressView().progressViewStyle(CircularProgressViewStyle())
//                        }
//                    } else {
//                        Section(header: Text(genre)) {
//                            ForEach(artistDictionary[genre]!) { artist in
//                                Link(artist.first, destination: URL(string: artist.second) ?? URL(string: "https://itunes.apple.com/search?term=\(artist.first)&entity=musicArtist")!).foregroundColor(.black)
//                            }
//                        }
//                    }
//                }
//                .onAppear {
//                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//                        if countdownSeconds > 0 {
//                            countdownSeconds -= 1
//                        } else {
//                            timer.invalidate()
//                        }
//                    }
//                }
//            }
//            .navigationBarTitle("Artists")
//
//
//            Spacer()
//            Button("Find Music", action: {
//                state.findMusic()
//                findMusicPressed = true
//            })
//        }.onAppear(perform: {
//            state.requestAccessToLocationData()
//        })
//    }
//}

struct ContentView: View {
    @ObservedObject private var state = StateController()
    @State var findMusicPressed = false
    
    var body: some View {
        var isLoading = state.isLoading
        VStack {
            if isLoading {
                ProgressView().progressViewStyle(CircularProgressViewStyle())
            } else {
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
                isLoading = true
                state.findMusic()
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
