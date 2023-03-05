//
//  User.swift
//  EatSure
//
//  Created by Sachin on 1/16/23.
//

import Foundation

// MARK: - User
struct UserModel: Decodable {
    
    let userId: String
    let fullName: String
    let dateOfBirth: String?
    let gender: String?
    let location: Location
    let contactNo: String?
    let email: String?
    let password: String
    let isActive: Bool
}

// MARK: - Location
struct Location: Decodable {
    let latitude: Double
    let longitude: Double
}
