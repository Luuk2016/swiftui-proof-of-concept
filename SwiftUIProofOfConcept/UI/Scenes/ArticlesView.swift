//
//  ArticlesView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 20/04/2023.
//

import SwiftUI

struct ArticlesView: View {
    var body: some View {
        Text("Articles View")
    }
}

struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ArticlesView()
                .navigationTitle("Articles")
        }
    }
}
