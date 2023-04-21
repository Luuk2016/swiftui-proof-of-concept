//
//  SwiftUIProofOfConceptApp.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 19/04/2023.
//

import SwiftUI

@main
struct Application: App {
    @AppStorage("selectedTheme") var selectedTheme: Theme = .system
    
    private var preferredColorScheme: ColorScheme? {
        switch(selectedTheme) {
        case .dark:
            return .dark
        case .light:
            return .light
        case .system:
            return nil
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                WelcomeView()
                    .preferredColorScheme(preferredColorScheme)
            }
        }
    }
}
