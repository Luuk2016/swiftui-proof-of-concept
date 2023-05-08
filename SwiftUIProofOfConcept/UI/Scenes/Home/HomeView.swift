//
//  HomeView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 21/04/2023.
//

import SwiftUI
import AVKit

struct HomeView: View {
    // MARK: Properties
    @StateObject private var viewModel: HomeViewModel = HomeViewModel()

    var body: some View {
        ScrollView {
            if viewModel.trendingMovies.isEmpty {
                Text("No results")
            } else {
                HStack {
                    Text("Trending movies")
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                }
                .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.trendingMovies) { movie in
                            NavigationLink {
                                MovieDetailView(movie: movie)
                            } label: {
                                TrendingMovieCard(movie: movie)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }

            VStack {
                HStack {
                    Text("Currently playing")
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                }

                CurrentlyPlayingCard(movieName: "Big Buck Bunny", videoURL: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)

                CurrentlyPlayingCard(movieName: "Elephants Dream", videoURL: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")!)
            }
            .padding(.horizontal)
        }
        .task {
            viewModel.getTrendingMovies()
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
