//
//  NutritionFactsCollectionViewCell.swift
//  EatSure
//
//  Created by Sachin on 2/6/23.
//

import UIKit

class NutritionFactsCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Variables
    static let cellIdentifier = "NutritionFactsCollectionViewCell"
    
    //MARK: - UI Components
    private let titleLabel = CustomLabel(labelType: .key,
                                         textColor: .dark)
    
    private let valueLabel = CustomLabel(labelType: .value,
                                         textColor: .primary)
    
    //  MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
        
        setUpConstraints()
        setUpLayer()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Setup UI Constraints
    private func setUpConstraints(){
       
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 35),
                       
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            valueLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
        titleLabel.backgroundColor = ColorGuide.primaryColor
        valueLabel.backgroundColor = .secondarySystemBackground
    }
    
    private func setUpLayer(){
        contentView.layer.cornerRadius = 4
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.shadowOffset = CGSize(width: -3, height: 3)
        contentView.layer.shadowOpacity = 0.3
    }

    //MARK: - Set Up Values
    public func setUpValues(title: String, value: String)
    {
        self.titleLabel.text = title
        self.valueLabel.text = value
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setUpLayer()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.valueLabel.text = nil
    }
    
}
