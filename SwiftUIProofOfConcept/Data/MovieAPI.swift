//
//  MovieAPI.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 24/04/2023.
//

import SwiftUI

struct MovieAPI {
    // MARK: Properties
    private let baseURL: String = "https://api.themoviedb.org/3"
    private let apiKey: String = "f829d6f95757da6cb795e8aae1c7685b"
    
    // MARK: Methods
    func getTopRatedMovies() async throws -> [Movie] {
        let url: String = baseURL + "/movie/top_rated?api_key=" + apiKey + "&language=en-US&page=1"
        
        let response = try await execute(type: MovieAPIResponse.self, url: url)
        
        return response.results
    }
    
    func getTrendingMovies() async throws -> [Movie] {
        let url: String = baseURL + "/trending/movie/day?api_key=" + apiKey + "&language=en-US&page=1"
        
        let response = try await execute(type: MovieAPIResponse.self, url: url)
        
        return response.results
    }
    
    private func execute<T: Decodable>(type: T.Type, url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200..<400).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        guard let result = try? JSONDecoder().decode(T.self, from: data) else {
            throw URLError(.cannotDecodeRawData)
        }
        
        return result
    }
}
