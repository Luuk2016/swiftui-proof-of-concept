//
//  MoviesView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 20/04/2023.
//

import SwiftUI

struct MoviesView: View {
    // MARK: Properties
    @ObservedObject private var viewModel = MoviesViewModel()

    var body: some View {
        ScrollView {
            LazyVStack {
                if viewModel.topRatedMovies.isEmpty {
                    Text("No results")
                }
                ForEach(viewModel.topRatedMovies) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieListRow(movie: movie)
                    }
                }
            }
        }
        .task {
            viewModel.getTopRatedMovies()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MoviesView()
                .navigationTitle("Movies")
        }
    }
}
