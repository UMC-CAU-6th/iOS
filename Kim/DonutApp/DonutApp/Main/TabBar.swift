//
//  ViewController.swift
//  DonutApp
//
//  Created by 김나연 on 5/9/24.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        appearance()
    }
    private func setTabBar(){
        let vc1 = UINavigationController(rootViewController: MainViewController())
        vc1.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house.fill"), tag: 1)
        let vc2 = MapViewController()
        vc2.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "map.fill"), tag: 2)
        let vc3 = ShoppingViewController()
        vc3.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "cart.fill"), tag: 3)
        self.viewControllers = [vc1,vc2,vc3]
    }
    private func appearance() {
        let barAppearance = UITabBarAppearance()
        barAppearance.stackedLayoutAppearance.selected.iconColor = .systemBlue
        self.tabBar.standardAppearance = barAppearance
        self.tabBar.backgroundColor = .white
    }
}
