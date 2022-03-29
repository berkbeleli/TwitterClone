//
//  LoginView.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            
           AuthenticationHeaderView(title1: "Hello", title2: "Welcome Back")
            
            VStack(spacing: 35){
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
                
            }
            .padding(.horizontal,30)
            .padding(.top, 40)
            
            
            HStack{
                Spacer()
                
                NavigationLink {
                    Text("Reset password view")
                } label: {
                    Text("Forgot password?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,20)
                }
            }
            
            Button {
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .foregroundColor(.white)
                    .frame(width: 340, height: 45)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)

            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                Text("Don't have an account?")
                    .font(.footnote)
                
                Text("Sign Up")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
        }
        .padding(.bottom,30)
        .foregroundColor(Color(.systemBlue))
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
        
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
