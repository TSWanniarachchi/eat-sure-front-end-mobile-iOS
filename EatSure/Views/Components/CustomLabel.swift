//
//  CustomLabel.swift
//  EatSure
//
//  Created by Sachin on 2/21/23.
//

import UIKit

class CustomLabel: UILabel {
    
    enum LabelType {
        case header1
        case header2
        case header3
        case text1
        case text2
        case text3
        case paragraph1
        case paragraph2
        case key
        case value
    }
    
    enum TextColor {
        case primary
        case seondary
        case dark
    }

    init(labelType: LabelType, textColor: TextColor){
        super.init(frame: .zero)
        
        self.text = "Error"
        self.textAlignment = .left
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 0
        
        switch textColor{
        case .primary:
            self.textColor = .label
        case .seondary:
            self.textColor = .secondaryLabel
        case .dark:
            self.textColor = .black
        }
        
        switch labelType{
        case .header1:
            self.font = .systemFont(ofSize: 24, weight: .bold)
        case .header2:
            self.font = .systemFont(ofSize: 22, weight: .semibold)
        case .header3:
            self.font = .systemFont(ofSize: 19, weight: .semibold)
        case .text1:
            self.font = .systemFont(ofSize: 18, weight: .medium)
        case .text2:
            self.font = .systemFont(ofSize: 18, weight: .light)
        case .text3:
            self.font = .systemFont(ofSize: 15, weight: .medium)
        case .paragraph1:
            self.font = .systemFont(ofSize: 18, weight: .medium)
        case .paragraph2:
            self.font = .systemFont(ofSize: 17, weight: .medium)
        case .key:
            self.textAlignment = .center
            self.font = .systemFont(ofSize: 16, weight: .regular)
        case .value:
            self.textAlignment = .center
            self.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
