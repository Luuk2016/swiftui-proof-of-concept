//
//  MovieAPI.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 24/04/2023.
//

import SwiftUI
import Combine

final class MovieAPI {
    // MARK: Properties
    private var cancellables: [AnyCancellable] = []
    private let baseURL: String = "https://api.themoviedb.org/3"
    private let apiKey: String = "f829d6f95757da6cb795e8aae1c7685b"

    // MARK: Methods
    func getTopRatedMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let url = URL(string: baseURL + "/movie/top_rated?api_key=" + apiKey + "&language=en-US&page=1")!
        execute(type: MovieAPIResponse.self, url: url, completion: { result in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }

    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let url = URL(string: baseURL + "/trending/movie/day?api_key=" + apiKey + "&language=en-US&page=1")!
        execute(type: MovieAPIResponse.self, url: url, completion: { result in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }

    private func execute<T: Decodable>(type: T.Type, url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: T.self, decoder: JSONDecoder())
            .sink(
                receiveCompletion: { result in
                    switch result {
                    case .finished:
                        break
                    case .failure(let error):
                        completion(.failure(error))
                    }
                },
                receiveValue: { response in
                    completion(.success(response))
                }
            )
            .store(in: &cancellables)
    }
}
