

import UIKit
import SnapKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        let mainViewController = ViewController1()
        let navigationController = UINavigationController(rootViewController: mainViewController)

        // 탭바 설정
        let tabBarcontroller = UITabBarController()

        let view1 = ViewController1()
        let view2 = ViewController2()
        let view3 = ViewController3()

        tabBarcontroller.viewControllers = [view1, view2, view3]

        let view1item = UITabBarItem(title: "home", image: UIImage(systemName: "house"), tag: 0)
        let view2item = UITabBarItem(title: "map", image: UIImage(systemName: "map"), tag: 0)
        let view3item = UITabBarItem(title: "buy", image: UIImage(systemName: "cart"), tag: 0)

        view1.tabBarItem = view1item
        view2.tabBarItem = view2item
        view3.tabBarItem = view3item

        navigationController.tabBarItem.title = "Main"
        navigationController.tabBarItem.image = UIImage(systemName: "house")

        tabBarcontroller.viewControllers = [navigationController, view2, view3]

        window?.rootViewController = tabBarcontroller
        window?.makeKeyAndVisible()
    }


}
