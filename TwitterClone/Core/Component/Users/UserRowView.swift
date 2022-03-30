//
//  UserRowView.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    var body: some View {
        HStack(spacing: 15){
            
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
            .frame(width: 60, height: 60)
            
            VStack(alignment:.leading, spacing: 5){
                Text(user.username)
                    .font(.subheadline.bold())
                    .foregroundColor(.black)
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical,4)
    }
    
}

//struct UserRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserRowView()
//    }
//}
