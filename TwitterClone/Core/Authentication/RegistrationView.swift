//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            NavigationLink(destination: ProfilePhotoSelectorView(),
                           isActive: $viewModel.didAuthenticateUser,
                label: {})
            
            AuthenticationHeaderView(title1: "Get Started", title2: "Create your account")
            
            VStack(spacing: 35){
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                
                CustomInputField(imageName: "person", placeholderText: "Fullname", text: $fullname)
                
                CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
            }
            .padding(25)
            
            Button {
                viewModel.register(withEmail: email, password: password,
                                   fullname: fullname, username:username)
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
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Already have an account?")
                    .font(.footnote)
                
                Text("Sign In")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .padding(.bottom,30)
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
