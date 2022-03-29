//
//  SideMenuViewModal.swift
//  TwitterClone
//
//  Created by Berk Beleli on 2022-03-29.
//

import Foundation

enum SideMenuViewModal: Int, CaseIterable{
    case profile
    case lists
    case bookmarks
    case logout
    
    
    var description: String{
        switch self{
        case .profile: return "Profile"
        case .lists: return "Lists"
        case .bookmarks: return "Bookmarks"
        case .logout: return "LogOut"
        }
    }
    
    var imagerName: String{
        switch self{
        case .profile: return "person"
        case .lists: return "list.bullet"
        case .bookmarks: return "bookmark"
        case .logout: return "arrow.left.square"
        }
    }
    
}
