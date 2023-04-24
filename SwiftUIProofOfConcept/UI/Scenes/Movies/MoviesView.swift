//
//  MoviesView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 20/04/2023.
//

import SwiftUI

struct MoviesView: View {
    @ObservedObject private var viewModel = MoviesViewModel()

    var body: some View {
        ScrollView {
            LazyVStack() {
                ForEach(viewModel.topRatedMovies) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieListRow(movie: movie)
                    }
                }
            }
        }.task {
            viewModel.getTopRatedMovies()
        }
    }
}

struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MoviesView()
                .navigationTitle("Movies")
        }
    }
}
