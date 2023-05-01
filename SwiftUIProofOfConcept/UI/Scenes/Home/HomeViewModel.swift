//
//  HomeViewModel.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 24/04/2023.
//

import Foundation

final class HomeViewModel: ObservableObject {
    // MARK: - Properties
    @Published private(set) var trendingMovies: [Movie] = []
    
    private let movieAPI: MovieAPI = MovieAPI()
    
    // MARK: Methods
    func getTrendingMovies() {
        movieAPI.getTrendingMovies(completion: { result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self.trendingMovies = movies
                }
            case .failure(let error):
                print("Error \(error)")
            }
        })
    }
}
