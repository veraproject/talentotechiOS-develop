//
//  RegisterClientRouter.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/26/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol RegisterClientRouterProtocol: BaseRouter {
    func presentConfirmRegisterClient()
}

class RegisterClientRouter: RegisterClientRouterProtocol {
    
    private var viewController:RegisterClientViewController?
    
    init(viewController: RegisterClientViewController) {
        self.viewController = viewController
    }
    
    //MARK: RegisterClientRouterProtocol
    func presentConfirmRegisterClient() {
        self.viewController?.performSegue(withIdentifier: "confirmRegisterClientSegue", sender: nil)
    }
    

}
