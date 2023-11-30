//
//  TabBarViewController.swift
//  YouTubeB
//
//  Created by borys on 30.11.2023.
//

import UIKit
import SnapKit

class TabBarVC: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .black
        self.delegate = self
        
    }
    
    //MARK: - Tab Setup
    private func setupTabs() {
        let home = self.createNav(with: "", and: UIImage(named: "Home1"), vc: HomeVC())
        self.setViewControllers([], animated: true)
        
        let shorts = self.createNav(with: "", and: UIImage(named: "Shorts"), vc: ShortsVC())
        self.setViewControllers([], animated: true)
        
        let subscription = self.createNav(with: "", and: UIImage(named: "Subscription1"), vc: SubscriptionVC())
        self.setViewControllers([], animated: true)
        
        let library = self.createNav(with: "", and: UIImage(named: "Library1"), vc: LibraryVC())
        self.setViewControllers([home, shorts, subscription, library], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if self.selectedIndex == 1 {
            let alert = UIAlertController(title: "В розробці", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dissmis", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        if self.selectedIndex == 3 {
            let alert = UIAlertController(title: "В розробці", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dissmis", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}
