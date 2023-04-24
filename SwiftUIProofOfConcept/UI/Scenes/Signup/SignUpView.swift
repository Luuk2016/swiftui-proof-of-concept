//
//  SignUpView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 20/04/2023.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var termsAndConditions: Bool = false
    
    private var buttonDisabled: Bool {
        [email, password].contains(where: \.isEmpty) || !termsAndConditions
    }
    
    var body: some View {
        VStack(spacing: 18) {
            Spacer()
            
            Text("Create an account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 25)
            
            CustomTextField(title: "Email address", text: $email)
            
            CustomSecureField(title: "Password", text: $password)
            
            Toggle(isOn: $termsAndConditions) {
                Text("I agree with the terms & conditions")
            }
            .padding(.bottom, 20)
            
            NavigationLink {
                HomeTabView()
            } label: {
                Text("Register")
            }
            .buttonStyle(PrimaryButtonStyle())
            .disabled(buttonDisabled)
            
            Spacer()
            
            HStack {
                Text("Already have an account?")
                
                NavigationLink("Login") {
                    LoginView()
                }.foregroundColor(Color("SecondaryColor"))
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
