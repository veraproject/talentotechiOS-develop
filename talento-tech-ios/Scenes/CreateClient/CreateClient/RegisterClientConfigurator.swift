//
//  RegisterClientConfigurator.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/26/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit
import Firebase

class RegisterClientConfigurator {
    
    public static let sharedInstance = RegisterClientConfigurator()
    
    // MARK: Configuration
    func configure(viewController:RegisterClientViewController) {
        
        // Inicializamos el router
        let router = RegisterClientRouter(viewController: viewController)
        
        let ref: DatabaseReference =  Database.database().reference().child("Clients")
        
        // Inicializamos el interactor
        let interactor = RegisterClientInteractor(reference: ref)
        
        // Inicializamos el presenter
        let presenter = RegisterClientPresenter(view: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter
    }
}
