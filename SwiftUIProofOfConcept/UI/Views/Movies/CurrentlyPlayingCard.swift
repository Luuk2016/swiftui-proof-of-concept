//
//  CurrentlyPlayingCard.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 24/04/2023.
//

import SwiftUI
import AVKit

struct CurrentlyPlayingCard: View {
    // MARK: Properties
    var movieName: String
    var videoURL: URL

    var body: some View {
        VStack(spacing: 0) {
            VideoPlayer(player: AVPlayer(url: videoURL))
                .frame(height: 240)
                .foregroundColor(.white)

            HStack {
               Text(movieName)
                   .foregroundColor(.white)
                   .fontWeight(.heavy)
               Spacer()
            }
            .padding()
            .background(Color(red: 61/255, green: 61/255, blue: 88/255))
       }
       .cornerRadius(10)
    }
}

struct CurrentlyPlayingCard_Previews: PreviewProvider {
    static var previews: some View {
        CurrentlyPlayingCard(movieName: "Big Buck Bunny", videoURL: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
    }
}
