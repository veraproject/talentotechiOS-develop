//
//  LoginConfigurator.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 7/09/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

class LoginConfigurator {
    
    // MARK: Object lifecycle
    public static let sharedInstance = LoginConfigurator()
    
    // MARK: Configuration
    func configure(viewController:LoginViewController) {
        // Inicializamos el router
        let router = LoginRouter(viewController: viewController)
        
        // Ocultamos el navigationbar
        viewController.navigationController?.setNavigationBarHidden(false, animated:false);
        
        let interactor = LoginInteractor(viewController: viewController)
        
        // Inicializamos el presenter
        let presenter = LoginPresenter(interactor: interactor, router: router, view: viewController)
        
        viewController.presenter = presenter
    }

}
