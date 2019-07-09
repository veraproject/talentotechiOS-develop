//
//  WindowConfigurator.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 7/09/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

class WindowConfigurator {

    private let loginViewController:LoginViewController
    
    init() {
        self.loginViewController = UIStoryboard.login.instantiate(LoginViewController.self)
    }
    
    func configure() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        var navigationController:UINavigationController
        
        navigationController = UINavigationController(rootViewController: self.loginViewController)
        
        navigationController.navigationBar.topItem?.title = " "
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return window
    }
    
}
