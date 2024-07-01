//
//  TabA.swift
//  iOS_7th_homework
//
//  Created by 한지강 on 5/27/24.
//
import UIKit

class TabAViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonTitle = "A탭 앨범 부르기"
        view.backgroundColor = .white // View의 배경색 설정
    }
}



class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }

    private func setupTabBarController() {
        let tabA = TabAViewController()
        tabA.tabBarItem = UITabBarItem(title: "A탭", image: UIImage(systemName: "photo"), tag: 1)

        let tabB = TabBViewController()
        tabB.tabBarItem = UITabBarItem(title: "B탭", image: UIImage(systemName: "photo"), tag: 2)

        let tabC = TabCViewController()
        tabC.tabBarItem = UITabBarItem(title: "C탭", image: UIImage(systemName: "photo"), tag: 3)

        viewControllers = [tabA, tabB, tabC]
        selectedViewController = tabA // 앱 실행 시 TabA가 먼저 나타나도록 설정
    }
}
