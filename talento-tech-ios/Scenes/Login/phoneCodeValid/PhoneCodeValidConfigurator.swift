//
//  PhoneCodeValidConfigurator.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/27/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

class PhoneCodeValidConfigurator {
    // MARK: Object lifecycle
    public static let sharedInstance = PhoneCodeValidConfigurator()
    
    // MARK: Configuration
    func configure(viewController:PhoneCodeViewController) {
        
        // Ocultamos el navigationbar
        viewController.navigationController?.setNavigationBarHidden(false, animated:false);
        
        // Ocultamos el boton back
        viewController.navigationItem.setHidesBackButton(false, animated:true);
        
        // Inicializamos el router
        let router = PhoneCodeValidRouter(viewController: viewController)
        
        // Inicializamos el interactor
        let interactor = PhoneCodeValidInteractor()
        
        // Inicializamos el presenter
        let presenter = PhoneCodeValidPresenter(view: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter
    }
}
