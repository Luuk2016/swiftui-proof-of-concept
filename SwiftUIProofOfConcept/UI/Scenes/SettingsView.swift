//
//  SettingsView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 20/04/2023.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("selectedTheme") var selectedTheme: Theme = .system
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Theme")) {
                    Picker("Theme", selection: $selectedTheme) {
                        ForEach(Theme.allCases, id: \.self) { theme in
                            Text(theme.friendlyName).tag(theme)
                        }
                    }
                    .pickerStyle(.segmented)
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
