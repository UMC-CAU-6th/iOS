//
//  DoughnutTabBarController.swift
//  Doughnut
//
//  Created by 정의찬 on 5/2/24.
//

import UIKit

class DoughnutTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        appearance()
        // Do any additional setup after loading the view.
    }
    
    private func setTabBar() {
        let firstVC = UINavigationController(rootViewController: MainViewController())
        firstVC.tabBarItem = UITabBarItem(title: "home", image: UIImage(systemName: "house"), tag: 1)
        firstVC.tabBarItem.badgeValue = "3"
        
        let secondVC = ShoppingViewController()
        secondVC.tabBarItem = UITabBarItem(title: "shopping", image: UIImage(systemName: "basket"), tag: 2)
        
        let thirdVC = MapViewController()
        thirdVC.tabBarItem = UITabBarItem(title: "map", image: UIImage(systemName: "mappin.and.ellipse"), tag: 3)
        
        self.viewControllers = [firstVC, secondVC, thirdVC]
    }
    
    private func appearance() {
        let barAppearance = UITabBarAppearance()
        barAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.orange
        barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.orange]
        barAppearance.stackedLayoutAppearance.selected.badgeBackgroundColor = UIColor.orange
        barAppearance.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor.orange
        
        self.tabBar.standardAppearance = barAppearance
        self.tabBar.backgroundColor = .clear
    }

}
