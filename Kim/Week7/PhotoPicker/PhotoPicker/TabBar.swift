//
//  TabBar.swift
//  PhotoPicker
//
//  Created by 김나연 on 6/1/24.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        appearance()
    }
    private func setTabBar(){
        let vc1 = UINavigationController(rootViewController: AViewController())
        vc1.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "a.circle"), tag: 1)
        let vc2 = BViewController()
        vc2.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "b.circle"), tag: 2)
        let vc3 = CViewController()
        vc3.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "c.circle"), tag: 3)
        self.viewControllers = [vc1,vc2,vc3]
    }
    private func appearance() {
        let barAppearance = UITabBarAppearance()
        barAppearance.stackedLayoutAppearance.selected.iconColor = .systemBlue
        self.tabBar.standardAppearance = barAppearance
        self.tabBar.backgroundColor = .white
    }
}
