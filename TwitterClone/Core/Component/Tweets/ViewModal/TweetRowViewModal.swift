//
//  TweetRowViewModal.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-30.
//

import Foundation

class TweetRowViewModal: ObservableObject{
    @Published var tweet: Tweet
    private let service = TweetService()
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweet(){
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    func unlineTweet(){
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
    
    func checkIfUserLikedTweet() {
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
    
    
}
