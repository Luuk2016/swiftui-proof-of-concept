//
//  CustomSecureField.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 20/04/2023.
//

import SwiftUI

struct CustomSecureField: View {
    // MARK: Properties
    let title: String
    @Binding var text: String

    var body: some View {
        SecureField(title, text: $text)
            .font(.title3)
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)

        Divider()
            .padding(.horizontal)
            .padding(.bottom, 20)
    }
}
