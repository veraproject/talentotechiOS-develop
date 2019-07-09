//
//  PhoneCodeValidRouter.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/27/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

class PhoneCodeValidRouter: BaseRouter {

    private var viewController:PhoneCodeViewController?
    
    init(viewController:PhoneCodeViewController) {
        self.viewController = viewController
    }
    
    func presentHomeVC() {
        let homeViewController = UIStoryboard.home.instantiate(HomeViewController.self)
        self.viewController?.navigationController?.pushViewController(homeViewController,
                                                                      animated: true)
    }
    
}
