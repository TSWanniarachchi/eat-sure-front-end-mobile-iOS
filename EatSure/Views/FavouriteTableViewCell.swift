//
//  CustomCell.swift
//  EatSure
//
//  Created by Sachin on 1/30/23.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {
    
    //MARK: - Variables
    static let identifier = "FavouriteTableViewCell"
    
    //MARK: - UI Components
    private let favFoodImageView = CustomImageView(image: UIImage(systemName: "questionmark")!,
                                                   imageType: .table,
                                                   imageLayout: .light,
                                                   cornerRadius: 15)
    
    private let foodNameLabel = CustomLabel(labelType: .text1,
                                            textColor: .primary)
    
    private let cuisinesTypeLabel = CustomLabel(labelType: .text3,
                                                textColor: .primary)
    
    private let calorieLabel = CustomLabel(labelType: .text3,
                                           textColor: .seondary)

    private let ratingLabel = CustomLabel(labelType: .text3,
                                          textColor: .seondary)
    
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(favFoodImageView)
        contentView.addSubview(foodNameLabel)
        contentView.addSubview(cuisinesTypeLabel)
        contentView.addSubview(calorieLabel)
        contentView.addSubview(ratingLabel)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Setup Values
    public func setUpValues(favFood: FavaroiteModel){
        
        self.favFoodImageView.kf.setImage(with: URL(string: favFood.imageUrl))
        self.foodNameLabel.text = favFood.name
        self.cuisinesTypeLabel.text = favFood.cuisinesType
        self.calorieLabel.addLeading(image: UIImage(systemName: "flame")?.withTintColor(.red) ?? UIImage(), text: "  \(favFood.nutritionFacts.calories) kcal")
        self.ratingLabel.addLeading(image: UIImage(systemName: "star.fill")?.withTintColor(.systemOrange) ?? UIImage(), text: "  \(favFood.rating)")
        
    }
    
    //  MARK: - UI Setup Constraints
    private func setUpConstraints(){
  
        NSLayoutConstraint.activate([
            favFoodImageView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            favFoodImageView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            favFoodImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            favFoodImageView.widthAnchor.constraint(equalToConstant: 135),

            foodNameLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor ,constant: 1),
            foodNameLabel.leadingAnchor.constraint(equalTo: self.favFoodImageView.trailingAnchor, constant: 10),
            foodNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -40),
     
            cuisinesTypeLabel.leadingAnchor.constraint(equalTo: self.favFoodImageView.trailingAnchor, constant: 10),
            cuisinesTypeLabel.bottomAnchor.constraint(equalTo: self.calorieLabel.topAnchor, constant: -4),
     
            calorieLabel.leadingAnchor.constraint(equalTo: self.favFoodImageView.trailingAnchor, constant: 10),
            calorieLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
 
            ratingLabel.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor, constant: 10),
            ratingLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
        ])
        
//        foodNameLabel.backgroundColor = .blue
//        removeFavFoodButton.backgroundColor = .red
//        cuisinesTypeLabel.backgroundColor = .green
//        calorieLabel.backgroundColor = .red
//        ratingLabel.backgroundColor = .green
    }
    
}
