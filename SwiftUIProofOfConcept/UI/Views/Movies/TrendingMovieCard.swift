//
//  TrendingMovieCard.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 24/04/2023.
//

import SwiftUI

struct TrendingMovieCard: View {
    // MARK: Properties
    var movie: Movie

    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: movie.backdropImageURL) { phase in
                switch phase {
                case .failure:
                    Text("Image couldn't be loaded")
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 340, height: 240)
                default:
                    Rectangle()
                        .fill(Color(red: 61/255, green: 61/255, blue: 88/255))
                        .frame(width: .greatestFiniteMagnitude, height: 240)
                }
            }

            VStack {
               HStack {
                   Text(movie.title)
                       .foregroundColor(.white)
                       .fontWeight(.heavy)
                   Spacer()
               }
               HStack {
                   Image(systemName: "hand.thumbsup.fill")
                   Text(String(format: "%.1f", movie.averageVote))
                   Spacer()
                   Text(movie.releaseDate)
               }
               .foregroundColor(.yellow)
            }
            .padding()
            .background(Color(red: 61/255, green: 61/255, blue: 88/255))
        }
        .cornerRadius(10)
    }
}

struct TrendingMovieCard_Previews: PreviewProvider {
    static var previews: some View {
        TrendingMovieCard(movie: Movie.testMovie1)
    }
}
