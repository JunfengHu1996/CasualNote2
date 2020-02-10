//
//  AppDelegate.swift
//  casualNote
//
//  Created by 胡俊峰 on 2/8/20.
//  Copyright © 2020 CasualNotes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let listViewController = ListViewController()
        navigationController = UINavigationController(rootViewController: listViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        initDB()
        
        return true
    }
    

    func initDB() -> Void {
    //        数据库文件路径没有时才创建数据库，确保数据库只创建一次
        if !FileManager.default.fileExists(atPath: DBPath()) {
            buildDataBase()
        }
    }
       

}

