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
    let nutritionFacts: FavNutritionFacts
    let rating: Double
    let imageUrl: String    
}

// MARK: - NutritionFacts
struct FavNutritionFacts: Decodable {
    let servingSize: Int
    let calories: Int
}
