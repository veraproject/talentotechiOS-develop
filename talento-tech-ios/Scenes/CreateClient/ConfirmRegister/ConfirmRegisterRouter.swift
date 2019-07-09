//
//  ConfirmRegisterRouter.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/26/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol ConfirmRegisterRouterProtocol: BaseRouter {
    func routerToHome()
}

class ConfirmRegisterRouter: ConfirmRegisterRouterProtocol {
    
    private var viewController: ConfirmRegisterViewController
    
    init(viewController: ConfirmRegisterViewController) {
        self.viewController = viewController
    }
    
    //MARK: ConfirmRegisterRouterProtocol
    func routerToHome() {
        let viewControllers = viewController.navigationController?.viewControllers
        var home: UIViewController? = nil
        for vc in viewControllers! {
            if vc.isKind(of: HomeViewController.self) {
                home = vc
                break
            }
        }
        if let homeVC = home {
            homeVC.navigationController?.setNavigationBarHidden(false, animated: false)
            
            self.viewController.navigationController?.popToViewController(homeVC, animated: true)
        }
        
    }
    

}
