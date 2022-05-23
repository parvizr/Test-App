//
//  CustomTabBarController.swift
//  TestApp
//
//  Created by javad on 19.04.22.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = HomeViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem.image = #imageLiteral(resourceName: "Home")
        
        let walletViewController = UIViewController()
        walletViewController.view.backgroundColor = .white
        let walletNavigationController = UINavigationController(rootViewController: walletViewController)
        walletNavigationController.tabBarItem.image = #imageLiteral(resourceName: "Wallet")
        
        let historyViewController = UIViewController()
        historyViewController.view.backgroundColor = .white
        let historyNavigationController = UINavigationController(rootViewController: historyViewController)
        historyNavigationController.tabBarItem.image = #imageLiteral(resourceName: "History")
        
        let accountViewController = UIViewController()
        accountViewController.view.backgroundColor = .white
        let accountNavigationController = UINavigationController(rootViewController: accountViewController)
        accountNavigationController.tabBarItem.image = #imageLiteral(resourceName: "Account")
        
        tabBar.isTranslucent = false
//        additionalSafeAreaInsets.bottom = 30
        
        // this code help to remove tab bar top line
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = UIColor.white
    
    
        viewControllers = [homeNavigationController, walletNavigationController, historyNavigationController, accountNavigationController]
        
    }
}


