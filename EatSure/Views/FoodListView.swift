//
//  FoodListView.swift
//  EatSure
//
//  Created by Sachin on 2/2/23.
//

import UIKit

final class FoodListView: UIView {
    
    //MARK: - Variables
    var UserId = "Sachin"
    var FoodData = [FoodModel]()
    
    //MARK: - UIComponents
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FoodCollectionViewCell.self,
                                forCellWithReuseIdentifier: FoodCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        //backgroundColor = .systemBlue
        addSubview(collectionView)
        addSubview(spinner)
        
        addConstraints()
        spinner.startAnimating()
        getFoods(cuisinesType: "Chinese")
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func getFoods(cuisinesType: String) {
        
//        let APIEndPoint = "foods?cuisinesType=\(cuisinesType)"
//        APICaller.shared.getFoods(URL: APIEndPoint) {result in
//            self.FoodData = result
//
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }
        //print(APIEndPoint)
    }
    
    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.spinner.stopAnimating()
            self.collectionView.isHidden = false
            UIView.animate(withDuration: 0.4){
                self.collectionView.alpha = 1
            }
        })
    }
}

extension FoodListView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return FoodData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: FoodCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? FoodCollectionViewCell else {
            fatalError("Unsupported Cell")
        }
        cell.configure(food: FoodData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width,
                      height: width * 1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let selectedFood =  FoodData[indexPath.row]
        print(selectedFood.name)
        
        //let detailVC = FoodDetailViewController(foodItem: FoodData[indexPath.row])
        
      
//        self.navigationController?.pushViewController(detailVC, animated: true)
    }

}
