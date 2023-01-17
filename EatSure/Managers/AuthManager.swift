//
//  AuthManager.swift
//  EatSure
//
//  Created by Sachin on 1/16/23.
//

import Foundation

final class AuthManager {
    
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = ""
        static let clientSecret = ""
    }
    
    private init() {}
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken : String? {
        return nil
    }
    
    private var refreshToken : String? {
        return nil
    }
    
    private var tokenExpirationDate : Date? {
        return nil
    }
    
    private var shouldRefreshToken : Bool {
        return false
    }
    
}
