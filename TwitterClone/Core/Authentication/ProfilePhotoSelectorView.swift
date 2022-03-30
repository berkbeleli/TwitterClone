//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-30.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            AuthenticationHeaderView(title1: "Setup your account",
                                     title2: "Add a Profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                         profileImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.top, 40)
                        .clipShape(Circle())
                }else{
                    Image("addphoto")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(.systemBlue))
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.top, 40)
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(width: 340, height: 45)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage(){
        if let selectedImage = selectedImage {
                 profileImage = Image(uiImage: selectedImage)
             }

    }
    
}


struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
