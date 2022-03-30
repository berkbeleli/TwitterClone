//
//  SearchBar.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-30.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack{
            TextField("Search", text: $text)
                .padding(10)
                .padding(.horizontal, 25)
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading,10)
                    }
                )
            
        }
        .padding(.horizontal,5)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
