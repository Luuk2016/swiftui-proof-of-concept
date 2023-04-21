//
//  HomeView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 20/04/2023.
//

import SwiftUI

struct HomeTabView: View {
    @State var selection: String = "Home"
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag("Home")
            ArticlesView()
                .tabItem {
                    Label("Articles", systemImage: "list.bullet")
                }
                .tag("Articles")
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag("Settings")
        }
        .navigationTitle(selection)
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
