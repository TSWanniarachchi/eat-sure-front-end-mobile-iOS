//
//  Food.swift
//  EatSure
//
//  Created by Sachin on 1/16/23.
//

import Foundation

// MARK: - Food Model
struct FoodModel: Codable {
    
    let foodId: String
    let name: String
    let cuisinesType: String
    let mealType: String
    let category: String
    let ingredients: [String]
    let nutritionFacts: NutritionFacts
    let rating: Double
    let imageUrl: String
    let description: String
    let isActive: Bool
}

// MARK: - NutritionFacts
struct NutritionFacts: Codable {
    let servingSize: Int
    let calories: Int
    let totalFat: String
    let saturatedFat: String
    let cholesterol: String
    let sodium: String
    let carbohydrate: String
    let sugars: String
    let protein: String
    let vitamin: String
    let calcium: String
    let Iron: String
}
