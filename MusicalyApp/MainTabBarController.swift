//
//  MainTabBarController.swift
//  MusicalyApp
//
//  Created by Mac on 17.05.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        let searchVC : SearchViewController = SearchViewController.loadFromStoryboard()
                
        viewControllers = [
            generateVC(rootViewController: searchVC, image: #imageLiteral(resourceName: "search"), title: "Search"),
            generateVC(rootViewController: LibraryViewController(), image: #imageLiteral(resourceName: "library"), title: "Library")
        ]
        

    }
    
    private func generateVC (rootViewController: UIViewController,
                             image: UIImage,
                             title: String) -> UIViewController {
        let navigationVC  = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC
    }
    
    
}
