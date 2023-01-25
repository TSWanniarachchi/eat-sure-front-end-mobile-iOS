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
    private let headerView = AuthHeaderView(title: "Sign Up", subTitle: "Create your account")
    
    private let  fullNameField = CustomTextField(fieldType: .text, placeholder: "Full Name")
    private let  emailField = CustomTextField(fieldType: .email, placeholder: "Email Address")
    private let  usernameField = CustomTextField(fieldType: .text, placeholder: "Username")
    private let  passwordField = CustomTextField(fieldType: .password,  placeholder: "Password")
    private let  confirmedPasswordField = CustomTextField(fieldType: .password,  placeholder: "Confirmed Password")
    
    private let  signUpButton = CustomButton(title: "Sign Up", hasBackground: true, fontsize: .big)
    private let  signInButton = CustomButton(title: "Already have an account? Sign In.", fontsize: .med)
    
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
        
        return tv
    }()
   
    //  MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.termsTextView.delegate = self
        self.signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //  MARK: - UI Setup
    private func setupUI() {
        title = ""
        view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(fullNameField)
        self.view.addSubview(emailField)
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(confirmedPasswordField)
        self.view.addSubview(signUpButton)
        self.view.addSubview(termsTextView)
        self.view.addSubview(signInButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        fullNameField.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        confirmedPasswordField.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        termsTextView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.fullNameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.fullNameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.fullNameField.heightAnchor.constraint(equalToConstant: 55),
            self.fullNameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.emailField.topAnchor.constraint(equalTo: fullNameField.bottomAnchor, constant: 22),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.usernameField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.confirmedPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.confirmedPasswordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.confirmedPasswordField.heightAnchor.constraint(equalToConstant: 55),
            self.confirmedPasswordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.signUpButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 55),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.termsTextView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 6),
            self.termsTextView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signInButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor, constant: 11),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 44),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
    // MARK: - Selectors
    @objc private func didTapSignUp(){
        print("DEBUG PRINT:", "page: SignUpViewController, func: didTapSignUp")
    }
    
    @objc private func didTapSignIn(){
        print("DEBUG PRINT:", "page: SignUpViewController, func:didTapSignIn")
        
        let vc = SignInViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SignUpViewController: UITextViewDelegate{
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
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
