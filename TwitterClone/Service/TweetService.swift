//
//  TweetService.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-30.
//

import Firebase

struct TweetService {
    
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timesstamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("tweets")
            .document().setData(data) { error in
                if let error = error{
                    print("Failed to upload tweet")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
}
