//
//  MoviesView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 20/04/2023.
//

import SwiftUI

struct MoviesView: View {
    var body: some View {
        Text("Movies View")
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
