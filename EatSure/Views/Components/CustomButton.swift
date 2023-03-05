//
//  CustomButton.swift
//  EatSure
//
//  Created by Sachin on 1/23/23.
//

import UIKit

class CustomButton: UIButton {
    
    enum ButtonType {
        case primary
        case secondary
        case label
    }

    enum FontSize {
        case big
        case med
        case small
    }
    
    let color = UIColor(rgb: 0x0059D4)

    init(buttonType: ButtonType, title: String, fontsize: FontSize){
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        switch buttonType{
        case .primary:
            self.layer.borderColor = UIColor.systemBlue.cgColor
            self.layer.borderWidth = 2
            self.backgroundColor = .white
            self.setTitleColor(color, for: .normal)
        case .secondary:
            self.backgroundColor = .systemBlue
            self.setTitleColor(.white, for: .normal)
        case .label:
            self.backgroundColor = .white
            self.setTitleColor(.systemBlue, for: .normal)
        }
        
        switch fontsize{
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        case .med:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
