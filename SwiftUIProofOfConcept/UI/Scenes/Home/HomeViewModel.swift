//
//  HomeViewModel.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 24/04/2023.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    // MARK: - Properties
    @Published private(set) var trendingMovies: [Movie] = []

    private let movieAPI: MovieAPI = MovieAPI()

    // MARK: Methods
    func getTrendingMovies() {
        Task {
            do {
                self.trendingMovies = try await movieAPI.getTrendingMovies()
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
}
