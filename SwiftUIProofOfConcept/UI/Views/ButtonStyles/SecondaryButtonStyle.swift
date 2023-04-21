//
//  SecondaryButtonStyle.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 20/04/2023.
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .foregroundColor(Color("PrimaryColor"))
            .padding()
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(50.0)
            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
    }
}
