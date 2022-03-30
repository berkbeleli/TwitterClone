//
//  UploadTweetViewModel.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-30.
//

import Foundation
import SwiftUI

class UploadTweetViewModel: ObservableObject{
    @Published var didUploadTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String){
        service.uploadTweet(caption: caption) { success in
            if success{
                self.didUploadTweet = true
            }
        }
    }
}
