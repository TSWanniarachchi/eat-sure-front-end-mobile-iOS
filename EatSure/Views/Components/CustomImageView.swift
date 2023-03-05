//
//  CustomImageView.swift
//  EatSure
//
//  Created by Sachin on 2/22/23.
//

import UIKit

class CustomImageView: UIImageView {
    
    enum ImageType {
        case page
        case table
        case collection
    }
    
    enum ImageLayout {
        case dark
        case light
    }
    
    init(image: UIImage, imageType: ImageType, imageLayout: ImageLayout, cornerRadius: CGFloat){
        super.init(frame: .zero)
        
        self.image = image
        self.contentMode = .scaleToFill
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        
        switch imageType{
        case .page:
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .table:
            self.layer.borderWidth = 1.5
            self.layer.borderColor = ColorGuide.primaryColor.cgColor
        case .collection:
            self.layer.borderWidth = 1.5
            self.layer.borderColor = ColorGuide.primaryColor.cgColor
        }
        
        if (imageLayout == .dark){
            self.addoverlay()
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
