//
//  Tweet.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-30.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable{
    @DocumentID var id: String?
    let caption: String
    let timesstamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool?
}
