//
//  SignInViewController.swift
//  EatSure
//
//  Created by Sachin on 1/18/23.
//

import UIKit

class SignInViewController: UIViewController {
    
    public var completionandler:((Bool) -> Void)?
    
   private let headerView = AuthHeaderView(title: "Sign In", subTitle: "Sign in your account")

    override func viewDidLoad() {
        super.viewDidLoad()

        title = ""
        view.backgroundColor = .systemBackground
        
        self.setupUI()
    }
    
    private func setupUI() {
        self.view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 350),
        ])
    }
    
}
