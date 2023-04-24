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
    
    private var buttonEnabled: Bool {
        [email, password].contains(where: \.isEmpty)
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Create an account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 30)
                                
            CustomTextField(title: "Email address", text: $email)
            
            CustomSecureField(title: "Password", text: $password)
            
            Button("Register") {
                print("Hello world!")
            }
            .disabled(!buttonEnabled)
            .buttonStyle(PrimaryButtonStyle())
            
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
