//
//  Test.swift
//  EatSure
//
//  Created by Sachin on 2/25/23.
//

import UIKit

class Test: UIViewController {
    
    //MARK: - UI Components
    let foodImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "FoodImage2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let foodCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self,forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
        
    
    
    
    
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo."
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    let scrollView = UIScrollView()
    let contentView = UIView()
            
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(
        image: UIImage(systemName: "cart"),
        style: .done,
        target: self,
        action: #selector(didTapCart)
        )
        title = ""
        
       
        setupScrollView()
        setupViews()
        
        setUpCllectionView()
      
    }
    
        func setupScrollView() {
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            contentView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        }
    
        func setupViews(){
            contentView.addSubview(foodImageView1)
            contentView.addSubview(titleLabel)
            contentView.addSubview(subtitleLabel)
           contentView.addSubview(foodCollectionView)
         
            
            foodImageView1.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            foodImageView1.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
            foodImageView1.heightAnchor.constraint(equalToConstant: 350).isActive = true
            
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            titleLabel.topAnchor.constraint(equalTo: foodImageView1.bottomAnchor, constant: 10).isActive = true
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
            
            foodCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
            foodCollectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
            foodCollectionView.heightAnchor.constraint(equalToConstant: 750).isActive = true
//            foodCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true


           
            
            subtitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            subtitleLabel.topAnchor.constraint(equalTo: foodCollectionView.bottomAnchor, constant: 25).isActive = true
            subtitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        }
    
    
        private func setUpCllectionView(){
            foodCollectionView.delegate = self
            foodCollectionView.dataSource = self
        }
    
    // MARK: - Selectors
    @objc private func didTapCart(){
        print("DEBUG PRINT:", "didTapCart")
    }

}

//MARK: - Collection View Section
extension Test: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemBlue
        return cell

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 60) / 2
        return CGSize(width: width,
                      height: width * 0.8)
    }

}

    
    























    
    

 

