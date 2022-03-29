//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
        VStack(alignment: .leading, spacing: 30) {
            VStack(alignment: .leading){
                Circle()
                    .frame(width: 45, height: 45)
                
                VStack(alignment: .leading,spacing: 5){
                    Text("Robert Downey")
                        .font(.headline)
                    
                    Text("@ironman")
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
                        ProfileView()
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

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
