//
//  MovieDetailView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 24/04/2023.
//

import SwiftUI

struct MovieDetailView: View {
    // MARK: Properties
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            AsyncImage(url: movie.backdropImageURL) { phase in
                switch phase {
                case .failure:
                    Text("Image couldn't be loaded")
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                default:
                    ProgressView()
                }
            }

            Text(movie.title)
                .font(.title)
                .fontWeight(.heavy)

            HStack {
                Image(systemName: "calendar")
                Text(movie.releaseDate)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("About film")
                    .font(.title3.bold())

                Text(movie.overview)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("Details")
                    .font(.title3.bold())

                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", movie.averageVote))
                }

                HStack {
                    Image(systemName: "person.3")
                    Text("\(movie.voteCount) votes")
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle(movie.title)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.testMovie1)
    }
}
