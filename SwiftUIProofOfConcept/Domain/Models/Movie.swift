//
//  Movie.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 24/04/2023.
//

import Foundation

struct Movie: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let releaseDate: String
    let overview: String
    let averageVote: Double
    let voteCount: Int
    
    private let backdropPath: String
    var backdropImageURL: URL {
        URL(string: "https://image.tmdb.org/t/p/w500" + backdropPath)!
    }
    
    private let posterPath: String
    var posterImageURL: URL {
        URL(string: "https://image.tmdb.org/t/p/w500" + posterPath)!
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "original_title"
        case releaseDate = "release_date"
        case overview = "overview"
        case averageVote = "vote_average"
        case voteCount = "vote_count"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
    }
    
    static let testMovie1: Movie = .init(id: 238, title: "The Godfather", releaseDate: "1972-03-14", overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.", averageVote: 8.7, voteCount: 10, backdropPath: "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg", posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")
    
    static let testMovie2: Movie = .init(id: 155, title: "The Dark Knight", releaseDate: "2008-07-14", overview: "Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.", averageVote: 8.5, voteCount: 5, backdropPath: "/dqK9Hag1054tghRQSqLSfrkvQnA.jpgg", posterPath: "/qJ2tW6WMUDux911r6m7haRef0WH.jpg")
    
    static let testMovies: [Movie] = [
        testMovie1,
        testMovie2,
    ]
}
