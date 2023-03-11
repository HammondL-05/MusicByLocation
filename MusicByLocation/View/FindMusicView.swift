//
//  FindMusicView.swift
//  MusicByLocation
//
//  Created by Leo Hammond on 11/03/2023.
//

import SwiftUI

struct FindMusicView: View {
    @ObservedObject private var state = StateController()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    VStack {
                        Image("MusicIcon")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .edgesIgnoringSafeArea(.all)
                        Text("Get the musician \n for your position")
                            .font(.system(size: 30))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                }
                
                Spacer()
                NavigationLink(destination: ArtistView()) {
                    Button("Find Music") {
                        state.findMusic()
                    }
                }
            }
            .onAppear(perform: {
                state.requestAccessToLocationData()
            })
        }
    }
}


struct FindMusicView_Previews: PreviewProvider {
    static var previews: some View {
        FindMusicView()
    }
}
