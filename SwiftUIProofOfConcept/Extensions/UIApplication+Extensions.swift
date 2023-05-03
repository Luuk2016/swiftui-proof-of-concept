//
//  UIApplication+Extensions.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 21/04/2023.
//

import UIKit

extension UIApplication {
    var version: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var build: String? {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }
}
