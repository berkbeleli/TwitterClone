//
//  UserStatsView.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
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
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
