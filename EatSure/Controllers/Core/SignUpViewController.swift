//
//  SignUpViewController.swift
//  EatSure
//
//  Created by Sachin on 1/18/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    public var completionandler:((Bool) -> Void)?
    
    //  MARK: - UI Components
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "questionmark")
        //        imageView.addoverlay()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 35, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let  emailField = CustomTextField(fieldType: .email,
                                              placeholder: "Email")
    
    private let  usernameField = CustomTextField(fieldType: .text,
                                                 placeholder: "Username")
    
    private let  passwordField = CustomTextField(fieldType: .password,
                                                 placeholder: "Password")
    
    private let termsTextView: UITextView = {
        let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms & Conditions and your acknowledge that you have read our Privacy Policy.")
        
        attributedString.addAttribute(.link, value: "terms://termsAndConditions", range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
        
        attributedString.addAttribute(.link, value: "privacy://privacyPolicy", range: (attributedString.string as NSString).range(of: "Privacy Policy"))
        
        let tv = UITextView()
        tv.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        tv.backgroundColor = .clear
        tv.attributedText = attributedString
        tv.textColor = .label
        tv.isSelectable = true
        tv.isEditable = false
        tv.delaysContentTouches = false
        tv.isScrollEnabled = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private let signUpButton = CustomButton(buttonType: .secondary,
                                            title: "Sign Up",
                                            fontsize: .big)
    
    private let signInButton = CustomButton(buttonType: .primary,
                                            title: "Sign In",
                                            fontsize: .big)
    
    //  MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        termsTextView.delegate = self
        
        view.addSubview(backgroundImageView)
        view.addSubview(headerLabel)
        view.addSubview(emailField)
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(termsTextView)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        setUpValues()
        setUpConstraints()
        
        signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //  MARK: - Setup Values
    private func setUpValues() {
        backgroundImageView.image = UIImage(named: "background_signup")
        headerLabel.text = "Create Account"
    }
    
    //  MARK: - UI Setup Constraints
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            headerLabel.widthAnchor.constraint(equalToConstant: 160),
            
            emailField.bottomAnchor.constraint(equalTo: usernameField.topAnchor, constant: -10),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            
            usernameField.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -10),
            usernameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameField.heightAnchor.constraint(equalToConstant: 50),
            usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            
            passwordField.bottomAnchor.constraint(equalTo: termsTextView.topAnchor, constant: 2),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            
            termsTextView.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -15),
            termsTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            signUpButton.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -10),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 55),
            signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            
            signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 55),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            
        ])
        
//        termsTextView.backgroundColor = .systemGreen
    }
    
    // MARK: - Selectors
    @objc private func didTapSignUp(){
        print("DEBUG PRINT:", "didTapSignUp")
    }
    
    @objc private func didTapSignIn(){
        print("DEBUG PRINT:", "didTapSignIn")
        
        let vc = SignInViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
}


// MARK: - UITextView
extension SignUpViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView,
                  shouldInteractWith URL: URL,
                  in characterRange: NSRange,
                  interaction: UITextItemInteraction) -> Bool {
        if URL.scheme == "terms" {
            self.showWebViewerController(with: "https://policies.google.com/terms?hl=en-US")
        }else if URL.scheme == "privacy"{
            self.showWebViewerController(with: "https://policies.google.com/privacy?hl=en-US")
        }
        return true
    }
    
    private func showWebViewerController(with urlString: String){
        let vc = WebViewerController(with: urlString)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
    
}
