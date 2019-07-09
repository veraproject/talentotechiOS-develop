//
//  HomeRouter.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/26/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol HomeRouterProtocol {
    func routerToCreateUser()
    func routerToListCliensView()
    func routerToCloseSession()
}

class HomeRouter: HomeRouterProtocol {
    
    private var viewController:HomeViewController
    
    init(viewController: HomeViewController) {
        self.viewController = viewController
    }
    
    //MARK: HomeRouterProtocol
    func routerToCreateUser() {
        let registerViewController = UIStoryboard.register.instantiate(RegisterClientViewController.self)
        self.viewController.navigationController?.pushViewController(registerViewController,
                                                                     animated: true)
    }
    
    func routerToListCliensView() {
        let listClientsVC = UIStoryboard.list.instantiate(ListClientViewController.self)
        self.viewController.navigationController?.pushViewController(listClientsVC,
                                                                     animated: true)
    }
    
    func routerToCloseSession() {
        // Mostramos el navigation controller
        self.viewController.navigationController?.setNavigationBarHidden(false, animated: false)
        
        self.viewController.navigationController?.popToRootViewController(animated: true)
    }
}
