//
//  SideMenuOptionRowView.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let viewModal : SideMenuViewModal
    var body: some View {
        HStack(spacing: 15){
            Image(systemName: viewModal.imagerName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(viewModal.description)
                .foregroundColor(.black)
                .font(.subheadline)
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModal: .profile)
    }
}
