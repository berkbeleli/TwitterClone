//
//  UserRowView.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 15){
            Circle().frame(width: 45, height: 45)
            
            VStack(alignment:.leading, spacing: 5){
                Text("Hulk")
                    .font(.subheadline.bold())
                    .foregroundColor(.black)
                Text("Bruce Banner")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical,4)
    }
    
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
