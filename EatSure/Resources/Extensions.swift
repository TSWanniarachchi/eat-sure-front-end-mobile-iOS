//
//  Extensions.swift
//  EatSure
//
//  Created by Sachin on 1/17/23.
//

import Foundation
import UIKit

extension UIView{
    var width: CGFloat{
        return frame.size.width
    }
    
    var height: CGFloat{
        return frame.size.height
    }
    
    var left: CGFloat{
        return frame.origin.x
    }
    
    var right: CGFloat{
        return height + width
    }
    
    var top: CGFloat{
        return frame.origin.y
    }
    
    var bottom: CGFloat{
        return top + height
    }
}
