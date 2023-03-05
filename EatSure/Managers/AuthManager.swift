//
//  AuthManager.swift
//  EatSure
//
//  Created by Sachin on 1/16/23.
//

import Foundation

final class AuthManager {
    
    static let shared = AuthManager()
    
    static var isSignedIn = false
    static var username = "Sachin"
    static var password = "test@123"
    
}
