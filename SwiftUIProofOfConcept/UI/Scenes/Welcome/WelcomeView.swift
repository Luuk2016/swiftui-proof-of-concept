//
//  WelcomeView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 19/04/2023.
//

import SwiftUI

struct WelcomeView: View {
    // MARK: Properties
    var body: some View {
        NavigationView {
            VStack {
                Text("This PoC application demonstrates the use of SwiftUI as a possible alternative to UIKit.")
                    .multilineTextAlignment(.center)

                Spacer()

                Image("onboard-vector")

                Spacer()

                NavigationLink("Get started") {
                    SignUpView()
                }
                .buttonStyle(PrimaryButtonStyle())

                NavigationLink("Already have an account?") {
                    LoginView()
                }
                .buttonStyle(SecondaryButtonStyle())

                NavigationLink("Skip") {
                    ContentView()
                }
                .buttonStyle(SecondaryButtonStyle())
            }
            .navigationBarBackButtonHidden(true)
            .padding()
            .navigationTitle("Welcome")
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WelcomeView()
        }
    }
}
