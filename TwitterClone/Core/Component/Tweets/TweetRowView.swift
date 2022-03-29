//
//  TweetRowView.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 12){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                //user info and tweet caption
                VStack(alignment: .leading, spacing: 4){
                    HStack {
                        Text("Robert Downey")
                            .font(.subheadline.bold())
                        
                        Text("@ironman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("4w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                 //tweet caption
                    
                    Text("3 words 8 letters. I got food")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
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
                    //action goes here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
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

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
