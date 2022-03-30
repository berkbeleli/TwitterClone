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
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets").getDocuments{snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
            completion(tweets)
        
        }
    }
    
}
