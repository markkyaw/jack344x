//
//  CustomTabBarController.swift
//  jackx
//
//  Created by Mark Kyaw on 3/11/21.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        The view controller on the bottom of app
//        Wrapping in UINavigationController allows the viewcontroller to ahve its own title bar
        let firstVC = UINavigationController(rootViewController: PrioritiesViewController())
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
//        firstVC.tabBarItem = UITabBarItem(title: "Allen", image: #imageLiteral(resourceName: "NavBG"), tag: 0)
        
        let secondVC = SignInViewController()
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        viewControllers = [firstVC, secondVC]
    }

}
