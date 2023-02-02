//
//  ProfileViewController.swift
//  EatSure
//
//  Created by Sachin on 1/16/23.
//

import UIKit

class FavouriteViewController: UIViewController {
    
    //MARK: - Variables
    var UserId = "Sachin"
    var data = [FavaroiteModel]()
    
    private let images: [UIImage] = [
        UIImage(named: "FoodImage1")!,
        UIImage(named: "FoodImage2")!,
        UIImage(named: "FoodImage1")!,
        UIImage(named: "FoodImage2")!,
        UIImage(named: "FoodImage1")!,
        UIImage(named: "FoodImage2")!,
        UIImage(named: "FoodImage1")!,
    ]
    
    //MARK: - UI Components
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return tableView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getFavorites(userId: UserId)
        
        setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    //  MARK: - UI Setup
    private func setupUI() {
        title = "Favourites"
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    // MARK: - Selectors
    
    // MARK: - Functions
    private func getFavorites(userId: String) {
       
        let APIEndPoint = "favorites/\(userId)"
        
        APICaller.shared.getFavorites(URL: APIEndPoint){ result in
            self.data = result
            print(self.data.count)
            print(self.data[0].name)
        }
        
        //print(APIEndPoint)
    }
    
}

extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("The Tableview could not dequeue a CustomCell in ViewController")
        }
        let image = self.images[indexPath.row]
        cell.configure(foodImage: image, foodLabel: "Air Fry Chopistics", cuisinesTypeLabel: "Chinese", calorieLabel: "Calorie : 106")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("DEBUG PRINT: Page:ProfileViewController Func:tableViewSelectedRow", indexPath.row)
    }
}
