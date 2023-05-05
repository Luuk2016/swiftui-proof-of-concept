//
//  ContentView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 20/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag("Home")
            
            NavigationView {
                MoviesView()
            }
            .tabItem {
                Label("Movies", systemImage: "play.circle")
            }
            .tag("Movies")
            
            NavigationView {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
            .tag("Settings")
        }
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
