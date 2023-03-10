//
//  CustomeTextField.swift
//  EatSure
//
//  Created by Sachin on 1/19/23.
//

import UIKit

class CustomTextField: UITextField {

    enum CustomTextFieldType{
        case text
        case email
        case password
    }
    
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType, placeholder: String) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 5
        self.placeholder = placeholder
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: 25,
                                             height: self.frame.size.height))
        switch fieldType {
        case .text:
            self.keyboardType = .default
        case .email:
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        }
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder){
        fatalError("init(coder:) as not been implemented")
    }
}
