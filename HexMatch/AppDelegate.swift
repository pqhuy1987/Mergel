//
//  AppDelegate.swift
//  HexMatch
//
//  Created by Josh McKee on 1/11/16.
//  Copyright © 2016 Josh McKee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var gameStatePath : String {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        return url.appendingPathComponent("gameState").path
    }
    
    var gameStatsPath : String {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        return url.appendingPathComponent("gameStats").path
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        GameState.instance = NSKeyedUnarchiver.unarchiveObject(withFile: self.gameStatePath) as? GameState
        if (GameState.instance == nil) {
            GameState.instance = GameState()
        }
        
        GameStats.instance = NSKeyedUnarchiver.unarchiveObject(withFile: self.gameStatsPath) as? GameStats
        if (GameStats.instance == nil) {
            GameStats.instance = GameStats()
        }
        
        return true
    }
    
    func save() {
        NSKeyedArchiver.archiveRootObject(GameState.instance!, toFile: self.gameStatePath)
        NSKeyedArchiver.archiveRootObject(GameStats.instance!, toFile: self.gameStatsPath)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        self.save()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        self.save()
    }


}

