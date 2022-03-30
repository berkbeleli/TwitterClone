//
//  UserService.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-30.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument{ snapshot,_ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self)else { return }
                
                completion(user)
                
            }

    }
    
    
}
