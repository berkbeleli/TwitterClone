//
//  AuthenticationHeaderView.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI

struct AuthenticationHeaderView: View {
    let title1: String
    let title2: String
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                Spacer()
            }
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
        
    }
}

struct AuthenticationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationHeaderView(title1: "Hello", title2: "Welcome Back")
    }
}
