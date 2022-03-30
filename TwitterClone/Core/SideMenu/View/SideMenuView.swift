//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
        if let user = viewModel.currentUser {
            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading,spacing: 5){
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    UserStatsView()
                        .padding(.vertical)
                    
                    
                }
                .padding(.leading)
                ForEach(SideMenuViewModal.allCases, id: \.self){option in
                    if option == .profile{
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            SideMenuOptionRowView(viewModal: option)
                        }
                    }else if option == .logout{
                        Button{
                            viewModel.signOut()
                        }label: {
                            SideMenuOptionRowView(viewModal: option)
                        }
                    }else{
                        SideMenuOptionRowView(viewModal: option)
                    }
                    
                    
                }
                Spacer()
                
            }
        }
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
