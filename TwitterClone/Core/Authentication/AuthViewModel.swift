//
//  AuthViewModal.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    
    init(){
        self.userSession = Auth.auth().currentUser

    }
    
    func login(withEmail email: String, password: String){
        print("login with email")
    }
    
    func register (withEmail email: String, password: String, fullname: String, username: String){
        print("register with email")
    }
    
}
