//
//  AppCache.swift
//  onboarding-screen
//
//  Created by A23 on 3/6/20.
//  Copyright © 2020 A23. All rights reserved.
//

import Foundation

final class AppCache {
    private let userDefaults = UserDefaults.standard
    private let flagKey = "shouldSkipToMain"
    var shouldSkipToMain: Bool {
        get {
            return (userDefaults.object(forKey: flagKey) != nil)
        }

        set(flag) {
            userDefaults.set(flag, forKey: flagKey)
        }
    }
    
    private init() {}
    
    static let shared = AppCache()
}
