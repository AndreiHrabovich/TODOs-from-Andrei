//
//  AppDelegate.swift
//  onboarding-screen
//
//  Created by A23 on 3/4/20.
//  Copyright © 2020 A23. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let appCache = AppCache.shared // to use when assembling the rootVC in here, the signleton can then be called directly in the onboarding vc method without having to call this instance from AppDelegate (but it's possible)
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = Assembler.assembleRootVC(withFlag: appCache.shouldSkipToMain)
        
        return true
    }
}
