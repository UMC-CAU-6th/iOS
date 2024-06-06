//
//  DoughnutTabBarController.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/6/24.
//

import UIKit

class DoughnutTabBarController: UITabBarController {

    
    
    public func setTabBar() {
        let homeVC = UINavigationController(rootViewController: MainViewController())
        homeVC.tabBarItem = UITabBarItem(title: "home", image: UIImage(systemName: "house"), tag: 1)
        homeVC.tabBarItem.badgeValue = "20"
        
        let ShoppingVC = ShoppingViewController()
        let shoppingNav = UINavigationController(rootViewController: ShoppingVC)
        ShoppingVC.tabBarItem = UITabBarItem(title: "shopping", image: UIImage(systemName: "basket"), tag: 2)
        ShoppingVC.tabBarItem.badgeValue = "990"
        
        let MapVC = MapViewController()
        MapVC.tabBarItem = UITabBarItem(title: "map", image: UIImage(systemName: "mappin.and.ellipse"), tag: 3)
        MapVC.tabBarItem.badgeValue = "50"
        
        self.viewControllers = [homeVC, shoppingNav, MapVC]
    }
    
    private func appearance() {
        let barAppearance = UITabBarAppearance()
        barAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        barAppearance.stackedLayoutAppearance.selected.badgeBackgroundColor = UIColor.systemRed
        barAppearance.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor.systemBlue
        
        self.tabBar.standardAppearance = barAppearance
        self.tabBar.backgroundColor = .clear
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setTabBar()
        appearance()
        // Do any additional setup after loading the view.
    }
    

}
