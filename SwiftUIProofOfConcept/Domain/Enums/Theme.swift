//
//  Theme.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 21/04/2023.
//

import Foundation

enum Theme: Int, CaseIterable {
    case dark
    case light
    case system
    
    var friendlyName: String {
        switch self {
        case .dark:
            return "Dark"
        case .light:
            return "Light"
        case .system:
            return "Default"
        }
    }
}
