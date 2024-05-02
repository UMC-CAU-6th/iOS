//
//  MainViewController.swift
//  Doughnut
//
//  Created by 황유빈 on 5/2/24.
//

import UIKit

class TabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let firstVC = UINavigationController(rootViewController: MainViewController())
        let secondVC = UINavigationController(rootViewController: MapViewController())
        let thirdVC = UINavigationController(rootViewController: BuyViewController())

            
        firstVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"),selectedImage: UIImage(systemName: "house.fill"))
        
        secondVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"),selectedImage: UIImage(systemName: "map.fill"))
        
        thirdVC.tabBarItem = UITabBarItem(title: "Basket", image: UIImage(systemName: "basket"),selectedImage: UIImage(systemName: "basket.fill"))

        self.viewControllers = [firstVC, secondVC, thirdVC]
        
        settingItem()
    }
    
    private func settingItem() {
        let item = UITabBarAppearance()
        item.stackedLayoutAppearance.selected.iconColor = UIColor.black
        item.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.tabBar.standardAppearance = item
    }c
}
