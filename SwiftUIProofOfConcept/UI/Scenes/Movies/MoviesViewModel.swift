//
//  MoviesViewModel.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 24/04/2023.
//

import Foundation

@MainActor
final class MoviesViewModel: ObservableObject {
    @Published private(set) var topRatedMovies: [Movie] = []

    private let movieAPI: MovieAPI = MovieAPI()

    // MARK: Methods
    func getTopRatedMovies() {
        Task {
            do {
                self.topRatedMovies = try await movieAPI.getTopRatedMovies()
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
}
