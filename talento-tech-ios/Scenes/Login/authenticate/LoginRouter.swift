//
//  LoginRouter.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 7/09/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol LoginRouterProtocol: BaseRouter {
    func routeToHome()
    func routerToPhoneCodeValidView()
}

class LoginRouter: LoginRouterProtocol, BaseRouter {

    private var viewController:LoginViewController
    
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    
    // MARK: Navigation
    func routeToHome() {
        let homeViewController = UIStoryboard.home.instantiate(HomeViewController.self)
        self.viewController.navigationController?.pushViewController(homeViewController,
                                                                     animated: true)
    }
    
    func routerToPhoneCodeValidView() {
        self.viewController.performSegue(withIdentifier: "segueVerifyCode", sender: nil)
    }
    
}
