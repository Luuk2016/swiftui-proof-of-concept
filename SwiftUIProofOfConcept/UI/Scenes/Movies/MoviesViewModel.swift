//
//  MoviesViewModel.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 24/04/2023.
//

import Foundation

final class MoviesViewModel: ObservableObject {
    @Published private(set) var topRatedMovies: [Movie] = []

    private let movieAPI: MovieAPI = MovieAPI()

    // MARK: Methods
    func getTopRatedMovies() {
        movieAPI.getTopRatedMovies(completion: { result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self.topRatedMovies = movies
                }
            case .failure(let error):
                print("Error \(error)")
            }
        })
    }
}
