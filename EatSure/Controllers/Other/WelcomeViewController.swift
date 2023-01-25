//
//  WelcomeViewController.swift
//  EatSure
//
//  Created by Sachin on 1/16/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //  MARK: - UI Components
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign In with Eat Sure", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    //  MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Eat Sure"
        view.backgroundColor = .systemPurple
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapNavigateSignIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(
            x: 20,
            y: view.height-50-view.safeAreaInsets.bottom,
            width: view.width-40,
            height: 50
        )
    }
    
    // MARK: - Selectors
    @objc func didTapNavigateSignIn(){
        print("DEBUG PRINT:", "didTapNavigateSignIn")
        
        let vc = SignInViewController()
        vc.completionandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func handleSignIn(success: Bool){
        // Log User in or yell at them for error
    }
    
}
