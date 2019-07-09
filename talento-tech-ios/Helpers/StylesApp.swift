//
//  StylesApp.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 7/09/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class StylesApp: NSObject {

    static func setup() {
        
        self.setupKeyboardManager()
        
        // Navigation Bar Appearance
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Helvetica", size:17)!,
                                                            NSAttributedStringKey.foregroundColor: Color.navigationItems]
        UINavigationBar.appearance().barTintColor = Color.navigationBackground
        UINavigationBar.appearance().tintColor = Color.navigationItems
        UINavigationBar.appearance().isTranslucent = false
    }
    
    private static func setupKeyboardManager() {
        IQKeyboardManager.sharedManager().enable = true
        //IQKeyboardManager.sharedManager().toolbarDoneBarButtonItemText = "Aceptar"
        IQKeyboardManager.sharedManager().placeholderFont = UIFont(name: "Helvetica", size:15)
        IQKeyboardManager.sharedManager().previousNextDisplayMode = IQPreviousNextDisplayMode.alwaysHide
    }
    
}


struct Color {
    
    static let pastelGreen = UIColor(hex: "008995")
    static let pastelRed = UIColor(hex: "ff8974")
    static let pastelGray = UIColor(hex: "a7a9ac")
    static let pastelYellow = UIColor(hex: "e6c834")
    static let pastelDarkGreen = UIColor(hex: "008c95")
    static let pastelGrayDeselect = UIColor(hex: "B8B7BA")
    static let pastelBlue = UIColor(hex: "30405B")
    
    static let errorRed = UIColor(hex: "e54b3b")
    
    static let transparentWhite = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
    static let transparentGray = UIColor(hex: "414042").withAlphaComponent(0.5)
    
    static let navigationItems = UIColor.white
    static let navigationBackground = pastelBlue
    
    static let errorState = errorRed
    
    static let darkGreen = Color.pastelDarkGreen
}
