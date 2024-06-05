//
//  phoViewController.swift
//  Photo
//
//  Created by 황유빈 on 5/31/24.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabAViewController = TabAViewController()
        tabAViewController.tabBarItem = UITabBarItem(title: "A탭", image: nil, selectedImage: nil)
                
        let tabBViewController = TabBViewController()
        tabBViewController.tabBarItem = UITabBarItem(title: "B탭", image: nil, selectedImage: nil)
        
        let tabCViewController = TabCViewController()
        tabCViewController.tabBarItem = UITabBarItem(title: "C탭", image: nil, selectedImage: nil)
                
        viewControllers = [tabAViewController, tabBViewController, tabCViewController]
    }

}
