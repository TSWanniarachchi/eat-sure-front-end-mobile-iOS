//
//  FoodDetailViewController.swift
//  EatSure
//
//  Created by Sachin on 2/3/23.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    //MARK: - Variables
    var NutritionFactsTitle = ["Total Fat", "Carbohydrate", "Protein", "Cholesterol", "Sugar", "Sodium"]
    var NutritionFactsValues = ["0", "0", "0", "0", "0", "0"]
    var FoodData = [FoodModel]()
    var ResponseData = [ResponseModel]()
    var FoodId = ""
    
    //MARK: - UI Components
    private let spinner = CustomSpinner(size: .med,
                                        tintColor: ColorGuide.primaryColor)
    
    private let foodImageView = CustomImageView(image: UIImage(systemName: "questionmark")!,
                                                imageType: .page,
                                                imageLayout: .dark,
                                                cornerRadius: 35)
    
    private let addFavariouteButton = CustomImageButton(backgroundColor: .secondarySystemBackground,
                                                        image: UIImage(systemName: "heart.fill")!,
                                                        size: 20,
                                                        tintColor: .systemRed)
    
    private let foodNameLabel = CustomLabel(labelType: .header2,
                                            textColor: .primary)
    
    private let cuisinesTypeLabel = CustomLabel(labelType: .text2,
                                                textColor: .primary)
    
    private let mealTypeLabel = CustomLabel(labelType: .text2,
                                            textColor: .primary)
    
    private let calorieLabel = CustomLabel(labelType: .text1,
                                           textColor: .primary)
    
    private let ratingLabel = CustomLabel(labelType: .text1,
                                          textColor: .primary)
    
    private let horizontalLine = CustomHorizontalBar(backgroundColor: ColorGuide.primaryColor)
    
    private let nutritionFactsHeaderLabel = CustomLabel(labelType: .header3,
                                                        textColor: .primary)
    
    private let nutritionFactsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        // collectionView.register(UICollectionViewCell.self,forCellWithReuseIdentifier: "cell")
        collectionView.register(NutritionFactsCollectionViewCell.self,
                                forCellWithReuseIdentifier: NutritionFactsCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    private let descriptionHeaderLabel = CustomLabel(labelType: .header3,
                                                     textColor: .primary)
    
    private let descriptionLabel = CustomLabel(labelType: .paragraph1,
                                               textColor: .seondary)
    
    //MARK: - Initialization
    init(foodId: String, foodName: String){
        super.init(nibName: nil, bundle: nil)
        self.FoodId = foodId
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(foodImageView)
        view.addSubview(addFavariouteButton)
        view.addSubview(foodNameLabel)
        view.addSubview(cuisinesTypeLabel)
        view.addSubview(mealTypeLabel)
        view.addSubview(calorieLabel)
        view.addSubview(ratingLabel)
        view.addSubview(horizontalLine)
        view.addSubview(nutritionFactsHeaderLabel)
        view.addSubview(nutritionFactsCollectionView)
        view.addSubview(descriptionHeaderLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(spinner)
        
        visibleComponents(isVisible: false)
        spinner.startAnimating()
        fetchedFoodData(foodId: FoodId)
        setUpCllectionView()
        setUpConstraints()
        
        addFavariouteButton.addTarget(self, action: #selector(didTapAddFavarioute), for: .touchUpInside)
    }
    
    //  MARK: - Setup UI Constraints
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            foodImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            foodImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            foodImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            foodImageView.heightAnchor.constraint(equalToConstant: 250),
            
            addFavariouteButton.topAnchor.constraint(equalTo: foodImageView.topAnchor, constant: 10),
            addFavariouteButton.rightAnchor.constraint(equalTo: foodImageView.rightAnchor, constant: -10),
            addFavariouteButton.heightAnchor.constraint(equalToConstant: 35),
            addFavariouteButton.widthAnchor.constraint(equalToConstant: 35),
            
            foodNameLabel.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: 5),
            foodNameLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            foodNameLabel.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            foodNameLabel.heightAnchor.constraint(equalToConstant: 25),
            
            cuisinesTypeLabel.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 7),
            cuisinesTypeLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            cuisinesTypeLabel.heightAnchor.constraint(equalToConstant: 25),
            
            mealTypeLabel.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 10),
            mealTypeLabel.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            mealTypeLabel.heightAnchor.constraint(equalToConstant: 25),
            
            calorieLabel.topAnchor.constraint(equalTo: cuisinesTypeLabel.bottomAnchor, constant: 5),
            calorieLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            calorieLabel.heightAnchor.constraint(equalToConstant: 25),
            
            ratingLabel.topAnchor.constraint(equalTo: cuisinesTypeLabel.bottomAnchor, constant: 5),
            ratingLabel.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            ratingLabel.heightAnchor.constraint(equalToConstant: 25),
            
            horizontalLine.topAnchor.constraint(equalTo: calorieLabel.bottomAnchor, constant: 5),
            horizontalLine.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            horizontalLine.widthAnchor.constraint(equalToConstant: view.bounds.width - 30),
            horizontalLine.heightAnchor.constraint(equalToConstant: 1),
            
            nutritionFactsHeaderLabel.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 10),
            nutritionFactsHeaderLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            nutritionFactsHeaderLabel.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            nutritionFactsHeaderLabel.heightAnchor.constraint(equalToConstant: 25),
            
            nutritionFactsCollectionView.topAnchor.constraint(equalTo: nutritionFactsHeaderLabel.bottomAnchor, constant: 10),
            nutritionFactsCollectionView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            nutritionFactsCollectionView.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            nutritionFactsCollectionView.heightAnchor.constraint(equalToConstant: 190),
            
            descriptionHeaderLabel.topAnchor.constraint(equalTo: nutritionFactsCollectionView.bottomAnchor, constant: 10),
            descriptionHeaderLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            descriptionHeaderLabel.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            descriptionHeaderLabel.heightAnchor.constraint(equalToConstant: 25),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionHeaderLabel.bottomAnchor, constant: -8),
            descriptionLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            
        ])
        
        //        foodImageView.backgroundColor = .blue
        //        foodNameLabel.backgroundColor = .blue
    }
    
    //MARK: - Set Up Values
    public func fetchedFoodData(foodId: String){
        
        // Create API request
        let request = Request(endpoint: .foods,
                              pathComponents: [foodId])
        // print(request.url)
        
        // Call API request & get response
        APICaller.shared.getFoods(URL: request.url) {
            result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let model):
                    
                    self.FoodData = model
                    // print(self.FoodData[0].name!
                    
                    self.foodImageView.kf.setImage(with: URL(string: self.FoodData[0].imageUrl))
                    self.foodNameLabel.text = self.FoodData[0].name
                    self.cuisinesTypeLabel.text = "Cuisine : \(self.FoodData[0].cuisinesType)"
                    self.mealTypeLabel.text = "Meal : \(self.FoodData[0].mealType)"
                    self.calorieLabel.addLeading(image: UIImage(systemName: "flame")?.withTintColor(.red) ?? UIImage(), text: "  \(self.FoodData[0].nutritionFacts.calories)")
                    self.ratingLabel.addLeading(image: UIImage(systemName: "star.fill")?.withTintColor(.systemOrange) ?? UIImage(), text: "  \(self.FoodData[0].rating)")
                    self.nutritionFactsHeaderLabel.text = "Nutrition Facts"
                    self.descriptionHeaderLabel.text = "Description"
                    self.descriptionLabel.text = self.FoodData[0].description
                    
                    self.NutritionFactsValues[0] = self.FoodData[0].nutritionFacts.totalFat
                    self.NutritionFactsValues[1] = self.FoodData[0].nutritionFacts.carbohydrate
                    self.NutritionFactsValues[2] = self.FoodData[0].nutritionFacts.protein
                    self.NutritionFactsValues[3] = self.FoodData[0].nutritionFacts.cholesterol
                    self.NutritionFactsValues[4] = self.FoodData[0].nutritionFacts.sugars
                    self.NutritionFactsValues[5] = self.FoodData[0].nutritionFacts.sodium
                    self.nutritionFactsCollectionView.reloadData()
                    
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
            
        }// end APICaller
    }
    
    private func setUpCllectionView(){
        nutritionFactsCollectionView.delegate = self
        nutritionFactsCollectionView.dataSource = self
    }
    
    private func visibleComponents(isVisible: Bool) {
        
        if isVisible {
            DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                self.spinner.stopAnimating()
                self.foodImageView.isHidden = false
                self.addFavariouteButton.isHidden = false
                self.foodNameLabel.isHidden = false
                self.cuisinesTypeLabel.isHidden = false
                self.mealTypeLabel.isHidden = false
                self.calorieLabel.isHidden = false
                self.ratingLabel.isHidden = false
                self.horizontalLine.isHidden = false
                self.nutritionFactsHeaderLabel.isHidden = false
                self.nutritionFactsCollectionView.isHidden = false
                self.descriptionHeaderLabel.isHidden = false
                self.descriptionLabel.isHidden = false
                
                UIView.animate(withDuration: 0.4){
                    self.foodImageView.alpha = 1
                    self.addFavariouteButton.alpha = 1
                    self.foodNameLabel.alpha = 1
                    self.cuisinesTypeLabel.alpha = 1
                    self.mealTypeLabel.alpha = 1
                    self.calorieLabel.alpha = 1
                    self.ratingLabel.alpha = 1
                    self.horizontalLine.alpha = 1
                    self.nutritionFactsHeaderLabel.alpha = 1
                    self.nutritionFactsCollectionView.alpha = 1
                    self.descriptionHeaderLabel.alpha = 1
                    self.descriptionLabel.alpha = 1
                }
            })
        }
        else {
            self.foodImageView.isHidden = true
            self.foodImageView.alpha = 0
            self.addFavariouteButton.isHidden = true
            self.addFavariouteButton.alpha = 0
            self.foodNameLabel.isHidden = true
            self.foodNameLabel.alpha = 0
            self.cuisinesTypeLabel.isHidden = true
            self.cuisinesTypeLabel.alpha = 0
            self.mealTypeLabel.isHidden = true
            self.mealTypeLabel.alpha = 0
            self.calorieLabel.isHidden = true
            self.calorieLabel.alpha = 0
            self.ratingLabel.isHidden = true
            self.ratingLabel.alpha = 0
            self.horizontalLine.isHidden = true
            self.horizontalLine.alpha = 0
            self.nutritionFactsHeaderLabel.isHidden = true
            self.nutritionFactsHeaderLabel.alpha = 0
            self.nutritionFactsCollectionView.isHidden = true
            self.nutritionFactsCollectionView.alpha = 0
            self.descriptionHeaderLabel.isHidden = true
            self.descriptionHeaderLabel.alpha = 0
            self.descriptionLabel.isHidden = true
            self.descriptionLabel.alpha = 0
        }
    }
    
    // MARK: - Selectors
    @objc private func didTapAddFavarioute(){
        // print("DEBUG PRINT:", "didTapAddFavarioute")
        
        // Create API request
        let request = Request(endpoint: .favorites)
        // print(request.url)
        
        // Create API request body
        let requestBody: [String: AnyHashable] = [
            "userId": AuthManager.username,
            "foodId": self.FoodId
        ]
        
        // Call API request & get response
        APICaller.shared.insertFavorites(URL: request.url, requestBody: requestBody) {
            result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let model):
                    
                    self.ResponseData = model
                    if(self.ResponseData[0].success == true){
                        let alert = UIAlertController(title: "Alert",
                                                      message: "Item Added Successfullty",
                                                      preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Dismise",
                                                      style: UIAlertAction.Style.default,
                                                      handler: nil))
                        self.present(alert,
                                     animated: true,
                                     completion: nil)
                    }
                    else{
                        let alert = UIAlertController(title: "Error",
                                                      message: String(describing: self.ResponseData[0].message),
                                                      preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Dismise",
                                                      style: UIAlertAction.Style.default,
                                                      handler: nil))
                        self.present(alert,
                                     animated: true,
                                     completion: nil)
                    }
                    
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
            
        }// end APICaller
    }
    
}


//MARK: - Collection View Section
extension FoodDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        //        cell.backgroundColor = .secondaryLabel
        //        return cell
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: NutritionFactsCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? NutritionFactsCollectionViewCell else {
            fatalError("Unsupported Cell")
        }
        cell.setUpValues(title: NutritionFactsTitle[indexPath.row], value: NutritionFactsValues[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 60) / 3
        return CGSize(width: width,
                      height: width * 0.8)
    }
    
}
