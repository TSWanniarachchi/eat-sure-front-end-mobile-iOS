//
//  CustomCell.swift
//  EatSure
//
//  Created by Sachin on 1/30/23.
//

import UIKit

class CustomCell: UITableViewCell {

 static let identifier = "CustomCell"
    
    private let favFoodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "questionmark")
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.tintColor = .label
        return imageView
    }()
    
    private let foodNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.text = "Error"
        return label
    }()
    
    private let cuisinesTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.text = "Error"
        return label
    }()
    
    private let calorieLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.text = "Error"
        return label
    }()
    
    private let removeFavFoodButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart.circle")?.withTintColor(.red, renderingMode: .alwaysOriginal), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(foodImage: UIImage, foodLabel: String, cuisinesTypeLabel: String, calorieLabel: String){
        self.favFoodImageView.image = foodImage
        self.foodNameLabel.text = foodLabel
        self.cuisinesTypeLabel.text = cuisinesTypeLabel
        self.calorieLabel.text = calorieLabel
    }
    
    private func setupUI(){
        self.contentView.addSubview(favFoodImageView)
        self.contentView.addSubview(foodNameLabel)
        self.contentView.addSubview(cuisinesTypeLabel)
        self.contentView.addSubview(calorieLabel)
        self.contentView.addSubview(removeFavFoodButton)
        
        favFoodImageView.translatesAutoresizingMaskIntoConstraints = false
        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cuisinesTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        calorieLabel.translatesAutoresizingMaskIntoConstraints = false
        removeFavFoodButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //favFoodImageView
            favFoodImageView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            favFoodImageView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            favFoodImageView.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            favFoodImageView.widthAnchor.constraint(equalToConstant: 115),
            
            //removeFavFoodButton
            removeFavFoodButton.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            removeFavFoodButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
           //removeFavFoodButton.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor, constant: -5),
            
            //foodNameLabel
            foodNameLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 2),
            foodNameLabel.leadingAnchor.constraint(equalTo: self.favFoodImageView.trailingAnchor, constant: 15),
            foodNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
           
            //cuisinesTypeLabel
            cuisinesTypeLabel.topAnchor.constraint(equalTo: self.foodNameLabel.bottomAnchor, constant: 28),
            cuisinesTypeLabel.leadingAnchor.constraint(equalTo: self.favFoodImageView.trailingAnchor, constant: 15),
            
            //calorieLabel
            calorieLabel.leadingAnchor.constraint(equalTo: self.favFoodImageView.trailingAnchor, constant: 15),
            calorieLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
        ])
    }
    
}
