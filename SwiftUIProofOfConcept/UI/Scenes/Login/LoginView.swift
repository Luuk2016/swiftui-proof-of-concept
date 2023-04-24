//
//  LoginView.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 20/04/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    private var buttonDisabled: Bool {
        [email, password].contains(where: \.isEmpty)
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Log in to your account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 30)
                        
            CustomTextField(title: "Email address", text: $email)
            
            CustomSecureField(title: "Password", text: $password)
            
            NavigationLink {
                HomeTabView()
            } label: {
                Text("Login")
            }
            .buttonStyle(PrimaryButtonStyle())
            .disabled(buttonDisabled)
            
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
