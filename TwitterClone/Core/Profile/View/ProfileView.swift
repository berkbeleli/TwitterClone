//
//  ProfileView.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModal = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading){
            headerView
            actionButtons
            userInfoDetail
            
            tweetFilterBar
            
            tweetsView
            
            
            Spacer()
        }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView{
    var headerView: some View{
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 15)
                        .foregroundColor(.white)
                }
                
                
                Circle()
                    .frame(width: 70, height: 70)
                    .offset(x: 15, y: 29)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View{
        HStack(spacing: 15){
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(
                    Circle().stroke(Color.gray,lineWidth: 0.5)
                )
            
            Button {
                //action
            } label: {
                Text("Edit Profile")
                    .font(.subheadline.bold())
                    .frame(width: 130, height: 30)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25).stroke(Color.gray,lineWidth: 0.5)
                    )
            }
            
        }
        .padding(.trailing)
    }
    
    var userInfoDetail: some View{
        
        VStack(alignment: .leading, spacing: 5){
            HStack {
                Text("Berk Beleli")
                    .font(.title2.bold())
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@berkbeleli")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your favorite programming language")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 25){
                
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("New York")
                }
                
                HStack{
                    Image(systemName: "link")
                    Text("www.berkbeleli.com")
                }
                
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            
            HStack(spacing: 25){
                HStack(spacing: 5){
                    Text("1550")
                        .font(.subheadline)
                        .bold()
                    
                    Text("Following")
                        .font(.caption)
                }
                
                HStack{
                    Text("9.8M")
                        .font(.subheadline)
                        .bold()
                    
                    Text("Followers")
                        .font(.caption)
                }
                
            }
            .padding(.vertical)
            
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View{
        HStack{
            ForEach(TweetFilterViewModal.allCases, id: \.rawValue){ item in
                
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else{
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                    
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
            
        }
        .overlay(Divider().offset(x: 0, y: 15))
        
    }
    
    var tweetsView: some View {
        ScrollView{
            LazyVStack{
                ForEach(0...9, id: \.self){ _ in
                    TweetRowView()
                        .padding()
                }
            }
        }
    }
    
}
