//
//  HomeConfigurator.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/26/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

class HomeConfigurator {
    
    // MARK: Object lifecycle
    public static let sharedInstance = HomeConfigurator()
    
    // MARK: Configuration
    func configure(viewController: HomeViewController) {
        
        viewController.navigationController?.setNavigationBarHidden(false, animated:false);
        
        viewController.navigationItem.setHidesBackButton(true, animated: false)
        
        viewController.navigationItem.title = ""
        
        // Inicializar router
        let router = HomeRouter(viewController: viewController)
        
        // Iniicalizar presenter
        let presenter = HomePresenter(view: viewController, router: router)
        
        viewController.presenter = presenter
    }
    
}
