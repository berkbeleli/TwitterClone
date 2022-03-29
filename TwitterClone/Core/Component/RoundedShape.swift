//
//  RoundedShape.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import SwiftUI

struct RoundedShape: Shape{
    
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
     
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        
        return Path(path.cgPath)
    }
    
  
    
}
