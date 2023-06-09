//
//  MovieListRow.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 21/04/2023.
//

import SwiftUI

struct MovieListRow: View {
    // MARK: Properties
    var movie: Movie

    var body: some View {
        HStack {
            AsyncImage(url: movie.posterImageURL) { phase in
                switch phase {
                case .failure:
                    Text("Image couldn't be loaded")
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 120)
                default:
                    ProgressView()
                        .frame(width: 80, height: 120)
                }
            }
            .clipped()
            .cornerRadius(10)

            VStack(alignment: .leading) {
                Text(movie.title)
                    .foregroundColor(.white)
                    .font(.title3)

                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", movie.averageVote))
                }
                .foregroundColor(.yellow)
            }
            Spacer()
        }
        .padding()
        .background(Color("MovieBackground"))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

struct MovieListRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieListRow(movie: Movie.testMovie1)
    }
}
