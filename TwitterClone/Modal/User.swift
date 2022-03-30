//
//  User.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-30.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    
}
