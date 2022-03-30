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
    @Published var didAuthenticateUser = false
    private var tempUserSession: FirebaseAuth.User?
    
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
            
            self.tempUserSession=user
    
            
            let data = ["email": email,
                        "username":username.lowercased(),
                        "fullname": fullname,
                        "uid":user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                }
            
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
        
    }
    
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                }
        }
    }
    
}
