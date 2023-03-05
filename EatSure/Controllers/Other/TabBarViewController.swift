//
//  TabBarViewController.swift
//  EatSure
//
//  Created by Sachin on 1/16/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = HomeViewController()
        let vc2 = FavouriteViewController()
        let vc3 = ProfileViewController()
        
        vc1.navigationItem.largeTitleDisplayMode = .automatic
        vc2.navigationItem.largeTitleDisplayMode = .automatic
        vc3.navigationItem.largeTitleDisplayMode = .automatic
                
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        
        nav1.tabBarItem = UITabBarItem(title: "Home",
                                       image: UIImage(systemName: "house"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Favourites",
                                       image: UIImage(systemName: "heart.circle.fill"),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Profile",
                                       image: UIImage(systemName: "person.crop.circle"),
                                       tag: 1)
        
        for nav in [nav1, nav2, nav3]{
            nav.navigationBar.prefersLargeTitles = true
        }
            
        setViewControllers([nav1, nav2, nav3],
                           animated: false)
    }
}
