//
//  SettingsView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 20/04/2023.
//

import SwiftUI

struct SettingsView: View {
    // MARK: Properties
    @StateObject var themeRepository: ThemeRepository = ThemeRepository.shared

    var body: some View {
        VStack {
            List {
                Section(header: Text("Theme")) {
                    Picker("Theme", selection: themeRepository.$selectedTheme) {
                        ForEach(Theme.allCases, id: \.self) { theme in
                            Text(theme.friendlyName)
                                .tag(theme)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section(header: Text("Actions")) {
                    NavigationLink {
                        WelcomeView()
                    } label: {
                        Label("Logout", systemImage: "rectangle.portrait.and.arrow.right")
                    }
                }

                Section(header: Text("About")) {
                    HStack {
                        Text("Developer")
                        Spacer()
                        Text("Luuk Kenselaar")
                    }
                    HStack {
                        Text("Version")
                        Spacer()
                        Text(UIApplication.shared.version ?? "1.0")
                    }
                    HStack {
                        Text("Build Number")
                        Spacer()
                        Text(UIApplication.shared.build ?? "1")
                    }
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
                .navigationTitle("Settings")
        }
    }
}
