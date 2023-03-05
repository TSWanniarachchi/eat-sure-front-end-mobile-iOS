//
//  ProfileViewController.swift
//  EatSure
//
//  Created by Sachin on 2/1/23.
//

import UIKit
import MapKit

class ProfileViewController: UIViewController {
    
    //MARK: - Variables
    var UserData = [UserModel]()
    
    //  MARK: - UI Components
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background_profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "user1")
        imageView.layer.cornerRadius = 70
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.systemBlue.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userIdLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.backgroundColor = .systemBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.backgroundColor = .systemBackground
        label.layer.shadowColor = UIColor.label.cgColor
        label.layer.cornerRadius = 35
        label.layer.shadowRadius = 5
        label.layer.shadowOpacity = 0.3
        label.layer.shadowOffset = CGSize.zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.backgroundColor = .systemBackground
        label.layer.shadowColor = UIColor.label.cgColor
        label.layer.cornerRadius = 35
        label.layer.shadowRadius = 5
        label.layer.shadowOpacity = 0.3
        label.layer.shadowOffset = CGSize.zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contactNoLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.backgroundColor = .systemBackground
        label.layer.shadowColor = UIColor.label.cgColor
        label.layer.cornerRadius = 35
        label.layer.shadowRadius = 5
        label.layer.shadowOpacity = 0.3
        label.layer.shadowOffset = CGSize.zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.backgroundColor = .systemBackground
        label.layer.shadowColor = UIColor.label.cgColor
        label.layer.cornerRadius = 35
        label.layer.shadowRadius = 5
        label.layer.shadowOpacity = 0.3
        label.layer.shadowOffset = CGSize.zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationUIView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .systemBackground
        uiView.layer.shadowColor = UIColor.label.cgColor
        uiView.layer.cornerRadius = 5
        uiView.layer.shadowRadius = 5
        uiView.layer.shadowOpacity = 0.3
        uiView.layer.shadowOffset = CGSize.zero
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mapView : MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    private let currentLocationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Current Location", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //  MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
        title = "My Profile"
        
        view.addSubview(backgroundImageView)
        view.addSubview(userProfileImageView)
        view.addSubview(userIdLabel)
        view.addSubview(logoutButton)
        view.addSubview(fullNameLabel)
        view.addSubview(genderLabel)
        view.addSubview(contactNoLabel)
        view.addSubview(emailLabel)
        view.addSubview(locationUIView)
        view.addSubview(locationLabel)
        view.addSubview(mapView)
        view.addSubview(currentLocationButton)
        view.addSubview(spinner)
        
        visibleComponents(isVisible: false)
        spinner.startAnimating()
        setUpValues()
        setUpConstraints()
        
        logoutButton.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
        currentLocationButton.addTarget(self, action: #selector(didTapCurrentLocation), for: .touchUpInside)
    }
    
    //  MARK: - Setup Values
    private func setUpValues() {
        
        // Create API request
        let request = Request(endpoint: .users,
                              pathComponents: [AuthManager.username,
                                               AuthManager.password])
        // print(request.url)
        
        // Call API request & get response
        APICaller.shared.getUsers(URL: request.url) {
            result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let model):
                    
                    self.UserData = model
                    // print(self.UserData[0].email!)
                    
                    // fetched data and set to UIComponents
                    self.userIdLabel.addLeading(image: UIImage(systemName: "person.badge.key")?.withTintColor(.systemBlue) ??                                UIImage(),
                                                text: "  \(self.UserData[0].userId)")
                    
                    self.fullNameLabel.addLeadingWithPrefix(prefix: "   ",
                                                            image: UIImage(systemName: "person")?.withTintColor(.systemBlue) ?? UIImage(),
                                                            text: "   \(self.UserData[0].fullName)")
                    
                    self.genderLabel.addLeadingWithPrefix(prefix: "   ",
                                                          image:UIImage(systemName:"figure.dress.line.vertical.figure")?.withTintColor(.systemBlue) ?? UIImage(),
                                                          text: "   \(self.UserData[0].gender ?? "Gender")")
                    
                    self.contactNoLabel.addLeadingWithPrefix(prefix: "   ",
                                                             image: UIImage(systemName: "phone")?.withTintColor(.systemBlue) ?? UIImage(),
                                                             text: "   \(self.UserData[0].contactNo ?? "Contact No")")
                    
                    self.emailLabel.addLeadingWithPrefix(prefix: "   ",
                                                         image: UIImage(systemName: "envelope")?.withTintColor(.systemBlue) ?? UIImage(),
                                                         text: "   \(self.UserData[0].email ?? "Email Address")")
                    
                    self.locationLabel.addLeadingWithPrefix(prefix: "   ",
                                                            image: UIImage(systemName: "map")?.withTintColor(.systemBlue) ?? UIImage(),
                                                            text: "    Asia / Colombo")
                    
                    self.setUpMap(prmLatitude: 51.481663, prmLongitude: -0.1931452)
                    
                    self.spinner.stopAnimating()
                    self.visibleComponents(isVisible: true)
                    
                case .failure(let error):
                    
                    let alert = UIAlertController(title: "Error",
                                                  message: String(describing: error),
                                                  preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Dismiss",
                                                  style: UIAlertAction.Style.default,
                                                  handler: nil))
                    self.present(alert,
                                 animated: true,
                                 completion: nil)
                    
                } // end switch
                
            } // end DispatchQueue
            
        }
    }
    
    func setUpMap(prmLatitude: CLLocationDegrees, prmLongitude: CLLocationDegrees) {
        let latitude: CLLocationDegrees = prmLatitude
        let longitude: CLLocationDegrees = prmLongitude
        
        let latDelta: CLLocationDegrees = 0.02
        let lonDelta: CLLocationDegrees = 0.02
        
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        let annotation: MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        annotation.title = "You are here"
        annotation.subtitle = "Your coordinates are \n\(latitude)° N \n\(longitude)° W"
        
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
    }
    
    //  MARK: - UI Setup Constraints
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            userProfileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            userProfileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 140),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 140),
            
            userIdLabel.bottomAnchor.constraint(equalTo: userProfileImageView.bottomAnchor, constant: -45),
            userIdLabel.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor, constant: 40),
            userIdLabel.heightAnchor.constraint(equalToConstant: 40),
            
            logoutButton.topAnchor.constraint(equalTo: userIdLabel.bottomAnchor, constant: 0),
            logoutButton.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor, constant: 40),
            logoutButton.heightAnchor.constraint(equalToConstant: 28),
            logoutButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.30),
            
            fullNameLabel.topAnchor.constraint(equalTo: userProfileImageView.bottomAnchor, constant: 20),
            fullNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 40),
            fullNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            
            genderLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 15),
            genderLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            genderLabel.heightAnchor.constraint(equalToConstant: 40),
            genderLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            
            contactNoLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 15),
            contactNoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            contactNoLabel.heightAnchor.constraint(equalToConstant: 40),
            contactNoLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            
            emailLabel.topAnchor.constraint(equalTo: contactNoLabel.bottomAnchor, constant: 15),
            emailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            emailLabel.heightAnchor.constraint(equalToConstant: 40),
            emailLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            
            locationUIView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 15),
            locationUIView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            locationUIView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            locationUIView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            
            locationLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 22),
            locationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            locationLabel.heightAnchor.constraint(equalToConstant: 30),
            
            mapView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 2),
            mapView.leftAnchor.constraint(equalTo: locationUIView.leftAnchor),
            mapView.rightAnchor.constraint(equalTo: locationUIView.rightAnchor),
            mapView.bottomAnchor.constraint(equalTo: locationUIView.bottomAnchor),
            
            currentLocationButton.bottomAnchor.constraint(equalTo: locationUIView.bottomAnchor, constant: -25),
            currentLocationButton.centerXAnchor.constraint(equalTo: locationUIView.centerXAnchor),
            currentLocationButton.heightAnchor.constraint(equalToConstant: 32),
            currentLocationButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
        ])
        //fullNameKeyLabel.backgroundColor = .systemGreen
    }
    
    // MARK: - Functions
    private func visibleComponents(isVisible: Bool) {
        
        if isVisible {
            
            self.userProfileImageView.isHidden = false
            self.userIdLabel.isHidden = false
            self.logoutButton.isHidden = false
            self.fullNameLabel.isHidden = false
            self.genderLabel.isHidden = false
            self.contactNoLabel.isHidden = false
            self.emailLabel.isHidden = false
            self.locationUIView.isHidden = false
            self.locationLabel.isHidden = false
            self.mapView.isHidden = false
            self.currentLocationButton.isHidden = false
            
            UIView.animate(withDuration: 0.4){
                self.userProfileImageView.alpha = 1
                self.userIdLabel.alpha = 1
                self.logoutButton.alpha = 1
                self.fullNameLabel.alpha = 1
                self.genderLabel.alpha = 1
                self.contactNoLabel.alpha = 1
                self.emailLabel.alpha = 1
                self.locationUIView.alpha = 1
                self.locationLabel.alpha = 1
                self.mapView.alpha = 1
                self.currentLocationButton.alpha = 1
            }
            
        }
        else {
            
            self.userProfileImageView.isHidden = true
            self.userProfileImageView.alpha = 0
            self.userIdLabel.isHidden = true
            self.userIdLabel.alpha = 0
            self.logoutButton.isHidden = true
            self.logoutButton.alpha = 0
            self.fullNameLabel.isHidden = true
            self.fullNameLabel.alpha = 0
            self.genderLabel.isHidden = true
            self.genderLabel.alpha = 0
            self.contactNoLabel.isHidden = true
            self.contactNoLabel.alpha = 0
            self.emailLabel.isHidden = true
            self.emailLabel.alpha = 0
            self.locationUIView.isHidden = true
            self.locationUIView.alpha = 0
            self.locationLabel.isHidden = true
            self.locationLabel.alpha = 0
            self.mapView.isHidden = true
            self.mapView.alpha = 0
            self.currentLocationButton.isHidden = true
            self.currentLocationButton.alpha = 0
            
        }
        
    }
    
    // MARK: - Selectors
    @objc private func didTapLogout(){
        //        print("DEBUG PRINT:", "didTapLogout")
        
        let vc = SignInViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    @objc private func didTapCurrentLocation(){
        //        print("DEBUG PRINT:", "didTapCurrentLocation")
        
        print("User Current Location : latitude = \(51.481663) longitude = \(-0.1931452)")
    }
    
}
