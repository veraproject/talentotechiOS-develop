//
//  LoginPresenter.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 7/09/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol LoginIPresenter {
    func onViewDidLoad()
    func loginFacebook()
    var router: LoginRouter { get }
    func verifyPhoneNumber(phone: String)
    func showPhoneLoginView()
}


class LoginPresenter: LoginIPresenter {
    
    var router: LoginRouter
    private var view:LoginView?
    private var interactor: LoginInteractor!
    
    init(interactor: LoginInteractor, router:LoginRouter, view: LoginView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    //MARK:LoginIPresenter
    func onViewDidLoad() {
        self.view?.initView()
    }
    
    func loginFacebook() {
        self.view?.enableFacebookButton(enable: false)
        self.interactor.loginFacebook { (result) in
            if result {
                self.view?.enableFacebookButton(enable: true)
                self.router.routeToHome()
            } else {
                self.view?.showLoginError(error: "Error al autenticarse")
            }
        }
    }

    func showPhoneLoginView() {
        self.view?.showContainerLoginPhone()
    }
    
    func verifyPhoneNumber(phone: String) {
        self.view?.showProgressActivityView(message: "")
        
        self.interactor.verifyPhoneNumber(phoneNumber: phone) { (result) in
            self.view?.hideProgressActivityView()
            
            self.view?.enableFacebookButton(enable: true)
            
            if result {
                self.router.routerToPhoneCodeValidView()
            } else {
                self.view?.showLoginError(error: "Error en la verificación del número de celular")
            }
        }
    }
    

}
