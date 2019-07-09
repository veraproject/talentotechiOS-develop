//
//  ConfirmRegisterConfigurator.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/26/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

class ConfirmRegisterConfigurator {
    
    // MARK: Object lifecycle
    public static let sharedInstance = ConfirmRegisterConfigurator()
    
    //MARK: Configurator
    func configure(viewController: ConfirmRegisterViewController) {
        
        // Inicializamos el router
        let router = ConfirmRegisterRouter(viewController: viewController)
        
        // Ocultamos el navigation controller
        viewController.navigationController?.setNavigationBarHidden(true, animated: true)
        
        // Inicializamos el presenter
        let presenter = ConfirmRegisterPresenter(view: viewController, router: router)
        
        viewController.presenter = presenter
    }
    
}
