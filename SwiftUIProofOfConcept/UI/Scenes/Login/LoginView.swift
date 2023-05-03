//
//  LoginView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 20/04/2023.
//

import SwiftUI

struct LoginView: View {
    // MARK: Properties
    @ObservedObject private var viewModel: LoginViewModel = LoginViewModel()

    var body: some View {
        VStack {
            Spacer()

            Text("Log in to your account")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 30)

            CustomTextField(title: "Email address", text: $viewModel.email)

            CustomSecureField(title: "Password", text: $viewModel.password)

            NavigationLink {
                HomeTabView()
            } label: {
                Text("Login")
            }
            .buttonStyle(PrimaryButtonStyle())
            .disabled(!viewModel.formIsValid)

            Spacer()

            HStack {
                Text("Don't have an account yet?")

                NavigationLink("Sign up") {
                    SignUpView()
                }.foregroundColor(Color("SecondaryColor"))
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
