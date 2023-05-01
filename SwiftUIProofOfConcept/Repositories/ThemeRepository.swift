//
//  ThemeRepository.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 24/04/2023.
//

import SwiftUI

final class ThemeRepository: ObservableObject {
    // MARK: Properties
    static let shared = ThemeRepository()
    
    @AppStorage("selectedTheme") var selectedTheme: Theme = .system
    
    private init() {}
    
    // MARK: Methods
    func getPreferredColorScheme() -> ColorScheme? {
        switch(selectedTheme) {
        case .dark:
            return .dark
        case .light:
            return .light
        case .system:
            return nil
        }
    }
}
