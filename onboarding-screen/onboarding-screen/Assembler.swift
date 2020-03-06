//
//  Assembler.swift
//  onboarding-screen
//
//  Created by A23 on 3/6/20.
//  Copyright © 2020 A23. All rights reserved.
//

import UIKit

final class Assembler {
    static func assembleRootVC(withFlag flag: Bool) -> UIViewController {
        let onboardingStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let onboardingVC = onboardingStoryboard.instantiateViewController(withIdentifier: "OnboardingVC")
        let mainVC = mainStoryboard.instantiateViewController(withIdentifier: "MainVC")
        
        return flag ? onboardingVC : mainVC
    }
}
