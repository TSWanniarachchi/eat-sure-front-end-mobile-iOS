//
//  Spinner.swift
//  EatSure
//
//  Created by Sachin on 2/22/23.
//

import UIKit

class CustomSpinner: UIActivityIndicatorView {
    
    enum Size {
        case small
        case med
        case big
    }
    
    init(size: Size, tintColor: UIColor){
        super.init(frame: .zero)
        
        switch size{
        case .small:
            self.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        case .med:
            self.transform = CGAffineTransform.init(scaleX: 2, y: 2)
        case .big:
            self.transform = CGAffineTransform.init(scaleX: 2.5, y: 2.5)
        }
   
        self.tintColor = tintColor
        self.hidesWhenStopped = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
