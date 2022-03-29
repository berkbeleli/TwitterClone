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
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to login error: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else{ return }
            
            self.userSession = user
            
            print("logged in")
        }
    }
    
    func register (withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error{
                print("DEBUG: Failed to register error: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else{ return }
            
            self.userSession = user
            
            print("DEBUG: Register succesfully")
            print("DEBUG: User is \(self.userSession)")
            
            let data = ["email": email,
                        "username":username.lowercased(),
                        "fullname": fullname,
                        "uid":user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("User Data uploaded")
                }
            
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
        
    }
    
}
