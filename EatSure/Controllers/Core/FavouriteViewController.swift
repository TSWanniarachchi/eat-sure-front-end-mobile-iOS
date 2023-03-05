//
//  FavouriteViewController.swift
//  EatSure
//
//  Created by Sachin on 1/16/23.
//

import UIKit

class FavouriteViewController: UIViewController {
    
    //MARK: - Variables
    var FavaroitesData = [FavaroiteModel]()
    var ResponeData = [ResponseModel]()
    
    //MARK: - UI Components
    private let spinner = CustomSpinner(size: .med,
                                        tintColor: ColorGuide.primaryColor)
    
    private let favouritesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(FavouriteTableViewCell.self, forCellReuseIdentifier: FavouriteTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
        title = "My Favourites"
    
        view.addSubview(favouritesTableView)
        view.addSubview(spinner)
        
        visibleComponents(isVisible: false)
        spinner.startAnimating()
        fetchedFavoritesData(userId: AuthManager.username)
        setUpFavouritesTableView()
        setUpConstraints()
    }
    
    //  MARK: - Setup UI Constraints
    private func setUpConstraints() {

        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            favouritesTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            favouritesTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            favouritesTableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            favouritesTableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
  
    // MARK: - Functions
    
    // Fetch Data API Call
    private func fetchedFavoritesData(userId: String) {
        
        // Create API request
        let request = Request(endpoint: .favorites,
                              pathComponents: [userId])
        // print(request.url)
        
        // Call API request & get response
        APICaller.shared.getFavorites(URL: request.url) {
            result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let model):
                    
                    self.FavaroitesData = model
                    self.favouritesTableView.reloadData()
                    
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
    
    // Delete Data API Call
    private func deleteFavoritesData(foodId : String){
       
         // Create API request
         let request = Request(endpoint: .favorites,
                               pathComponents: [AuthManager.username,
                                                foodId])
         // print(request.url)
         
         // Call API request & get response
         APICaller.shared.deleteFavorites(URL: request.url) {
             result in
             
             DispatchQueue.main.async {
                 
                 switch result {
                 case .success(let model):
                     
                     self.ResponeData = model
                     
                     if(self.ResponeData[0].success == true){
                         let alert = UIAlertController(title: "Alert",
                                                       message: "Item \(self.ResponeData[0].message)",
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
                                                       message: String(describing: self.ResponeData[0].message),
                                                       preferredStyle: UIAlertController.Style.alert)
                         alert.addAction(UIAlertAction(title: "Dismise",
                                                       style: UIAlertAction.Style.default,
                                                       handler: nil))
                         self.present(alert,
                                      animated: true,
                                      completion: nil)
                     }
                     
                     //   self.favouritesTableView.reloadData()
                     //   self.visibleComponents(isVisible: true)
                     
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
             
         } // end APICaller
        
    }
    
    private func setUpFavouritesTableView() {
        
        self.favouritesTableView.delegate = self
        self.favouritesTableView.dataSource = self
        
    }
    
    private func visibleComponents(isVisible: Bool) {
        if isVisible {
            DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                self.spinner.stopAnimating()
                self.favouritesTableView.isHidden = false
                UIView.animate(withDuration: 0.4){
                    self.favouritesTableView.alpha = 1
                }
            })
        }
        else {
            self.favouritesTableView.isHidden = true
            self.favouritesTableView.alpha = 0
        }
    }

}


// MARK: - UITableView
extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavaroitesData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteTableViewCell.identifier,
                                                       for: indexPath) as? FavouriteTableViewCell else {
            fatalError("The Tableview could not dequeue a CustomCell in ViewController")
        }
    
        cell.setUpValues(favFood: FavaroitesData[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .normal, title: "") {action, view, completion in
            
            //  self.visibleComponents(isVisible: false)
            //  self.spinner.startAnimating()
            
            // call API
            let selectedFavFood =  self.FavaroitesData[indexPath.row]
            self.deleteFavoritesData(foodId: selectedFavFood.foodId)
            
            // remove UI
            self.FavaroitesData.remove(at: indexPath.row)
            self.favouritesTableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        
        deleteAction.backgroundColor = .red
        deleteAction.image = UIImage(systemName: "trash")
        let actions = UISwipeActionsConfiguration(actions: [deleteAction])
        return actions
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedFavaroite =  FavaroitesData[indexPath.row]
        let detailVC = FoodDetailViewController(foodId: selectedFavaroite.foodId,
                                                foodName: selectedFavaroite.name)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
