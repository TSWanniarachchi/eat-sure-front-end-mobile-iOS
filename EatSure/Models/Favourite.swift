//
//  Favourite.swift
//  EatSure
//
//  Created by Sachin on 1/16/23.
//

import Foundation

struct FavaroiteModel: Decodable {
    
    let foodId: String
    let name: String
    let cuisinesType: String
    let mealType: String?
    let category: String?
    let rating: Double
    let imageUrl: String
    let isActive: Bool
    
}
