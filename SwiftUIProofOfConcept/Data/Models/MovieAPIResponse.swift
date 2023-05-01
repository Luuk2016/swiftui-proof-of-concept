//
//  MoviesResponse.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 24/04/2023.
//

import Foundation

struct MovieAPIResponse: Decodable {
    // MARK: Properties
    let results: [Movie]
}
