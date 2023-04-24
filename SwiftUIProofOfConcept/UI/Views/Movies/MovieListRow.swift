//
//  MovieListRow.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 21/04/2023.
//

import SwiftUI

struct MovieListRow: View {
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/8/8e/Jonagored.jpg")!) { phase in
                switch phase {
                case .failure:
                    Text("Ophalen mislukt")
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                default:
                    ProgressView()
                }
            }
        }
    }
}

struct MovieListRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieListRow()
    }
}
