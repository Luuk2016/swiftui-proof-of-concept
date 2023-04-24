//
//  SwiftUIProofOfConceptApp.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 19/04/2023.
//

import SwiftUI

@main
struct Application: App {
    @ObservedObject var themeRepository: ThemeRepository = ThemeRepository.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                WelcomeView()
                    .preferredColorScheme(themeRepository.getPreferredColorScheme())
            }
        }
    }
}
