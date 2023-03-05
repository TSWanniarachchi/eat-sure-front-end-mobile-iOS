//
//  CustomCollectionViewCell.swift
//  EatSure
//
//  Created by Sachin on 2/2/23.
//

import UIKit
import Kingfisher

final class FoodCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "FoodCollectionViewCell"
    
    private let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let foodNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.text = "Error"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let calorieLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "Error"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "Error"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //  MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
         
        setUpLayer()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(food: FoodModel)
    {
        self.foodImageView.kf.setImage(with: URL(string: food.imageUrl))
        self.foodNameLabel.text = food.name
        self.calorieLabel.addLeading(image: UIImage(systemName: "flame")?.withTintColor(.red) ?? UIImage(), text: "  \(food.nutritionFacts.calories)")
        self.ratingLabel.addLeading(image: UIImage(systemName: "star.fill")?.withTintColor(.systemOrange) ?? UIImage(), text: "  \(food.rating)")
    }
    
    //  MARK: - UI Setup
    private func setupUI(){
        contentView.backgroundColor = .secondarySystemBackground
        
        contentView.addSubviews(foodImageView, foodNameLabel, calorieLabel, ratingLabel)
        
        NSLayoutConstraint.activate([
            
            foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            foodImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            foodImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            foodImageView.bottomAnchor.constraint(equalTo: foodNameLabel.topAnchor, constant: -3),
            
            foodNameLabel.heightAnchor.constraint(equalToConstant: 25),
            foodNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            foodNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            foodNameLabel.bottomAnchor.constraint(equalTo: calorieLabel.topAnchor, constant: -3),
            
            calorieLabel.heightAnchor.constraint(equalToConstant: 25),
            calorieLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            calorieLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            
            ratingLabel.heightAnchor.constraint(equalToConstant: 25),
            ratingLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            ratingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            
        ])
        //        ratingLabel.backgroundColor = .systemPink
    }
    
    private func setUpLayer(){
        contentView.layer.cornerRadius = 4
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.shadowOffset = CGSize(width: -3, height: 3)
        contentView.layer.shadowOpacity = 0.3
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setUpLayer()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        foodImageView.image = nil
        foodNameLabel.text = nil
        calorieLabel.text = nil
        ratingLabel.text = nil
    }
}
