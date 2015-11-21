//
//  AppDelegate.swift
//  HealthKitTutorial
//
//  Created by 林东杰 on 11/11/15.
//  Copyright © 2015 Anta. All rights reserved.
//

import UIKit
import HealthKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //MARK: - Variable
    var tabBarController: UITabBarController?
    var window: UIWindow?
    /// 定义全局HealthStore变量
    let healthStore: HKHealthStore = HKHealthStore()
    
    
    //MARK: - Life Cycle
    
    //MARK: - TableView Delegate
    
    //MARK: - Custom Delegate
    
    //MARK: - TableView Datasource
    
    //MARK: - Event Response
    
    //MARK: - Private Methods
    
    //MARK: - Getters/Setters
    
    

    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        return true
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let profile: ProfileViewController = ProfileViewController(style: UITableViewStyle.Plain)
        profile.healthStore = self.healthStore
        
        let profileNavigation: UINavigationController = UINavigationController(rootViewController: profile)
        profileNavigation.tabBarItem.image = UIImage(named: "profile")
        profileNavigation.title = "Profile"
        
        self.tabBarController = UITabBarController()
        
        
        self.tabBarController!.viewControllers = [profileNavigation]
        
        let  screen: CGRect = UIScreen.mainScreen().bounds
        
        self.window = UIWindow(frame: screen)
        self.window!.backgroundColor = UIColor.blackColor()
        self.window!.rootViewController = tabBarController
        self.window!.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

