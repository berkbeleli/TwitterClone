//
//  TweetRowView.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    
    @ObservedObject var viewModel: TweetRowViewModal
    init(tweet: Tweet) {
    self.viewModel = TweetRowViewModal(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            
            if let user = viewModel.tweet.user{
                HStack(alignment: .top, spacing: 12){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color(.systemBlue))
                    
                    //user info and tweet caption
                    VStack(alignment: .leading, spacing: 4){
                        
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline.bold())
                            
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("4w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        
                        //tweet caption
                        
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                    
                }
            }
            // action buttons
            HStack {
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    viewModel.tweet.didLike ?? false ?
                    viewModel.unlineTweet() :
                    viewModel.likeTweet()
                } label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
                
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//    }
//}
