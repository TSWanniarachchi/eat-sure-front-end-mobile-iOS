//
//  CustomImageButton.swift
//  EatSure
//
//  Created by Sachin on 2/22/23.
//

import UIKit

class CustomImageButton: UIButton {
    
    init(backgroundColor: UIColor, image: UIImage, size: CGFloat, tintColor: UIColor){
        super.init(frame: .zero)

        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.setImage(image, for: .normal)
        self.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: size), forImageIn: .normal)
        self.imageView?.tintColor = tintColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
