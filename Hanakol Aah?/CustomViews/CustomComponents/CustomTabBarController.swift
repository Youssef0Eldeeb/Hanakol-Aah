//
//  CustomTabBarController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 06/04/2023.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        tabBar.tintColor = .lightGray
        tabBar.backgroundColor = .white
        
        delegate = self
        
        // Instantiate view controllers
        
        let vc1 = RegistrationViewController.instantiateVC(name: .Registration)
        let vc2 = ProfileViewController.instantiateVC(name: .Profile)
        let vc00 = ProfileViewController.instantiateVC(name: .Profile)
        let vc3 = VerfiyPassViewController.instantiateVC(name: .Registration)
        let vc4 = CreateNewPassViewController.instantiateVC(name: .Registration)
        
//        for item in tabBar.items!{
//            tabBar.itemSpacing = 12
//        }
        
        
        // Create TabBar items
        vc1.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "FridgeTabBar"), selectedImage: UIImage(named: ""))
        vc2.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "CalendarTabBar"), selectedImage: UIImage(named: ""))
        vc00.tabBarItem = UITabBarItem(title: "", image: UIImage(), selectedImage: UIImage())
        vc3.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "CameraTabBar"), selectedImage: UIImage(named: ""))
        vc4.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "TipsTabBar"), selectedImage: UIImage(named: ""))
        
        
        // Assign viewControllers to tabBarController
        let viewControllers = [vc1, vc2, vc00, vc3, vc4]
        self.setViewControllers(viewControllers, animated: false)
        
        
        guard let tabBar = self.tabBar as? CustomTabBar else { return }
        
        tabBar.didTapButton = { [unowned self] in
            self.routeToCreateNewAd()
        }
    }
    
    func routeToCreateNewAd() {
        let vc = ProfileViewController.instantiateVC(name: .Profile)
        vc.modalPresentationCapturesStatusBarAppearance = true
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

// MARK: - UITabBarController Delegate
extension CustomTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController) else {
            return true
        }
        
        // Your middle tab bar item index.
        // In my case it's 1.
        if selectedIndex == 2 {
            return false
        }
        
        return true
    }
}
