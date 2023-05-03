//
//  SignUpView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 20/04/2023.
//

import SwiftUI

struct SignUpView: View {
    // MARK: Properties
    @ObservedObject private var viewModel: SignUpViewModel = SignUpViewModel()

    var body: some View {
        VStack(spacing: 18) {
            Spacer()

            Text("Create an account")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 25)

            CustomTextField(title: "Full name", text: $viewModel.fullName)

            CustomTextField(title: "Email address", text: $viewModel.email)

            CustomSecureField(title: "Password", text: $viewModel.password)

            Toggle(isOn: $viewModel.termsAndConditions) {
                Text("I agree with the terms & conditions")
            }
            .padding(.bottom, 20)

            NavigationLink {
                HomeTabView()
            } label: {
                Text("Register")
            }
            .buttonStyle(PrimaryButtonStyle())
            .disabled(!viewModel.formIsValid)

            Spacer()

            HStack {
                Text("Already have an account?")

                NavigationLink("Login") {
                    LoginView()
                }
                .foregroundColor(Color("SecondaryColor"))
            }
        }
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignUpView()
        }
    }
}
