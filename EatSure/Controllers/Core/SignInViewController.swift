//
//  SignInViewController.swift
//  EatSure
//
//  Created by Sachin on 1/18/23.
//

import UIKit

class SignInViewController: UIViewController {
    
    //MARK: - Variables
    var UserData = [UserModel]()
    
    //  MARK: - UI Components
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "questionmark")
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
    
    private let  usernameField = CustomTextField(fieldType: .text,
                                                 placeholder: "Username")
    
    private let  passwordField = CustomTextField(fieldType: .password,
                                                 placeholder: "Password")
    
    private let  forgotPasswordButton = CustomButton(buttonType: .label,
                                                     title: "Forgot Password?",
                                                     fontsize: .small)
    
    private let signInButton = CustomButton(buttonType: .secondary,
                                            title: "Sign In",
                                            fontsize: .big)
    
    private let signUpButton = CustomButton(buttonType: .primary,
                                            title: "Sign Up",
                                            fontsize: .big)
    
    //  MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(backgroundImageView)
        view.addSubview(headerLabel)
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        setUpValues()
        setUpConstraints()
        
        forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
    }
    
    //  MARK: - Setup Values
    private func setUpValues() {
        backgroundImageView.image = UIImage(named: "background_signin")
        headerLabel.text = "Welcome Back"
        usernameField.text = "Sachin"
        passwordField.text = "test@123"
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
            
            usernameField.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -15),
            usernameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameField.heightAnchor.constraint(equalToConstant: 55),
            usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            
            passwordField.bottomAnchor.constraint(equalTo: forgotPasswordButton.topAnchor, constant: -5),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 55),
            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            
            forgotPasswordButton.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -30),
            forgotPasswordButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 25),
            
            signInButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -10),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 55),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 55),
            signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
        ])
        
        //        headerLabel.backgroundColor = .systemGreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Selectors
    @objc private func didTapForgotPassword(){
        print("DEBUG PRINT:", "didTapForgotPassword")
    }
    
    @objc private func didTapSignIn(){
        print("DEBUG PRINT:", "didTapSignIn")
        
        let username = usernameField.text?.trimmingCharacters(in: .whitespaces)
        let password = passwordField.text?.trimmingCharacters(in: .whitespaces)
        
        if (username!.isEmpty && password!.isEmpty) {
            let alert = UIAlertController(title: "Error", message: "Required Username & Password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if (username!.isEmpty) {
            let alert = UIAlertController(title: "Error", message: "Required Username", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if (password!.isEmpty) {
            let alert = UIAlertController(title: "Error", message: "Required Password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        // Create API request
        let request = Request(endpoint: .users,
                              pathComponents: [String(username!), String(password!)])
        //print(request.url)
        
        // Call API request & get response
        APICaller.shared.getUsers(URL: request.url) {
            result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                    // start case success
                case .success(let model):
                    
                    self.UserData = model
                    if (self.UserData.count == 1) {
                        //  print("User Have")
                        AuthManager.isSignedIn = true
                        AuthManager.username = username!
                        AuthManager.password = password!
                        
                        let vc = TabBarViewController()
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: false, completion: nil)
                    }
                    else {
                        //  print("User Nop")
                        let alert = UIAlertController(title: "Sign In Failed",
                                                      message: "Incorrect Username or Password",
                                                      preferredStyle: UIAlertController.Style.alert)
                        
                        alert.addAction(UIAlertAction(title: "Dismiss",
                                                      style: UIAlertAction.Style.default,
                                                      handler: nil))
                        self.present(alert,
                                     animated: true,
                                     completion: nil)
                    }// end case success
                    
                    // start case failure
                case .failure(let error):
                    
                    let alert = UIAlertController(title: "Error",
                                                  message: String(describing: error),
                                                  preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Dismiss",
                                                  style: UIAlertAction.Style.default,
                                                  handler: nil))
                    self.present(alert,
                                 animated: true,
                                 completion: nil) // end case failure
                    
                }// end switch
                
            }// end dispatchQueue thread
            
        }
    }
    
    @objc private func didTapSignUp(){
        print("DEBUG PRINT:", "didTapNewUser")
        
        let vc = SignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
}
