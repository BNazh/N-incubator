//
//  AppDelegate.swift
//  Sushi
//
//  Created by MacBook on 09.04.2018.
//  Copyright © 2018 MacBook. All rights reserved.
// Nazhmeddin Babakhanov

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let MenuVC = MenuViewController()
        let RestaurantsVC = RestaurantsViewController()
        let PersonalVC = PersonalViewController()
        let MoreVC = MoreViewController()
        
        MenuVC.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        RestaurantsVC.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        PersonalVC.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        MoreVC.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        MenuVC.tabBarItem = UITabBarItem(title: "Меню", image: #imageLiteral(resourceName: "menu"), tag: 0)
        RestaurantsVC.tabBarItem = UITabBarItem(title: "Рестораны", image: #imageLiteral(resourceName: "restaurant"), tag: 1)
        PersonalVC.tabBarItem = UITabBarItem(title: "Личный кабинет", image: #imageLiteral(resourceName: "personal"), tag: 2)
        MoreVC.tabBarItem = UITabBarItem(title: "Ещё", image:#imageLiteral(resourceName: "more"), tag: 3)
        
        MenuVC.navigationItem.title = "Меню"
        RestaurantsVC.navigationItem.title = "Рестораны"
        PersonalVC.navigationItem.title = "Личный кабинет"
        MoreVC.navigationItem.title = "Ещё"
        
        let MenuNavController = UINavigationController(rootViewController: MenuVC)
        let RestaurantNavController = UINavigationController(rootViewController: RestaurantsVC)
        let PersonalNavController = UINavigationController(rootViewController: PersonalVC)
        let MoreNavController = UINavigationController(rootViewController: MoreVC)
        
        let tabBarVC = MainTabBarController()
        tabBarVC.tabBar.isTranslucent = false
        tabBarVC.tabBar.barTintColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        tabBarVC.tabBar.unselectedItemTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBarVC.tabBar.tintColor = #colorLiteral(red: 1, green: 0.4431372549, blue: 0, alpha: 1)
        
        //Background Color
//        let numberOfItems = CGFloat(4)
//        let tabBarItemSize = CGSize(width: (tabBarVC.tabBar.frame.width) / numberOfItems + 10,height: (tabBarVC.tabBar.frame.height))
//        tabBarVC.tabBar.selectionIndicatorImage
//            = UIImage.imageWithColor(color: #colorLiteral(red: 1, green: 0.4419322212, blue: 0, alpha: 1),size: tabBarItemSize).resizableImage(withCapInsets: .zero)
//        tabBarVC.tabBar.clipsToBounds = true
        
        MenuNavController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        RestaurantNavController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        PersonalNavController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        MoreNavController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        MenuNavController.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        MenuNavController.navigationBar.barStyle = .black
        MenuNavController.navigationBar.barTintColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        RestaurantNavController.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        RestaurantNavController.navigationBar.barStyle = .black
        RestaurantNavController.navigationBar.barTintColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        PersonalNavController.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        PersonalNavController.navigationBar.barStyle = .black
        PersonalNavController.navigationBar.barTintColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        MoreNavController.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        MoreNavController.navigationBar.barStyle = .black
        MoreNavController.navigationBar.barTintColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
    tabBarVC.setViewControllers([MenuNavController,RestaurantNavController,PersonalNavController,MoreNavController], animated: true)
        tabBarVC.viewControllers![0].tabBarController?.tabBar.bounds.size = CGSize.init(width: 100, height: 100)
        self.window?.rootViewController = tabBarVC
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
