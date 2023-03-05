//
//  WelcomeViewController.swift
//  EatSure
//
//  Created by Sachin on 1/16/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //  MARK: - UI Components
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "questionmark")
        //imageView.addoverlay()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let appLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "questionmark")
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signInButton = CustomButton(buttonType: .primary,
                                            title: "Sign In",
                                            fontsize: .big)
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Eat Sure"
        view.backgroundColor = .systemBackground
        
        view.addSubview(backgroundImageView)
        view.addSubview(appLogoImageView)
        view.addSubview(infoLabel)
        view.addSubview(headerLabel)
        view.addSubview(signInButton)
       
        setUpValues()
        setUpConstraints()
        
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    //  MARK: - Setup Values
    private func setUpValues() {
        backgroundImageView.image = UIImage(named: "background_welcome")
        appLogoImageView.image = UIImage(named: "Logo 3")
        infoLabel.text = "You looked for apps that offer reliable and helpful nutrition information."
        headerLabel.text = "Healthy Eating"
    }
    
    //  MARK: - UI Setup Constraints
    private func setUpConstraints() {

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            appLogoImageView.bottomAnchor.constraint(equalTo: headerLabel.topAnchor, constant: -10),
            appLogoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            appLogoImageView.heightAnchor.constraint(equalToConstant: 100),
            appLogoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            headerLabel.bottomAnchor.constraint(equalTo: infoLabel.topAnchor, constant: -10),
            headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            headerLabel.heightAnchor.constraint(equalToConstant: 30),
            
            infoLabel.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -25),
            infoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            infoLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),

            signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 58),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
        ])
    
    }
    
    // MARK: - Selectors
    @objc private func didTapSignIn(){
//        print("DEBUG PRINT:", "didTapSignIn")
        
        let vc = TabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
}
