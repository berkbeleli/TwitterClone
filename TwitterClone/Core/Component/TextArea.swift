//
//  TextArea.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>){
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            if text.isEmpty{
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal,5)
                    .padding(.vertical,10)
            }
            
            TextEditor(text: $text)
                .padding(5)
        }
        .font(.body)
    }
}
