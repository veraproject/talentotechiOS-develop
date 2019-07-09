//
//  PhoneCodeValidPresenter.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/27/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol PhoneCodeValidIPresenter {
    func onViewDidLoad()
    func validCode(code:String)
    var router: PhoneCodeValidRouter { get }
}

class PhoneCodeValidPresenter: PhoneCodeValidIPresenter {

    private var interactor:PhoneCodeValidInteractor
    var router: PhoneCodeValidRouter
    private var view: PhoneCodeValidView?
    
    init(view: PhoneCodeValidView, interactor: PhoneCodeValidInteractor, router:PhoneCodeValidRouter) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    //MARK: PhoneCodeValidIPresenter
    func onViewDidLoad() {
        self.view?.initView()
    }
    
    func validCode(code: String) {
        self.view?.showProgressActivityView(message: "")
        
        guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else {
            self.view?.hideProgressActivityView()
            self.view?.showVerificationCodeError(error: "Autorización denegada")
            return
        }
        
        self.interactor.verifyPhoneNumber(phoneCode: code, verificationId: verificationID) { (result) in
            self.view?.hideProgressActivityView()
            
            if result {
                self.router.presentHomeVC()
            } else {
                self.view?.showVerificationCodeError(error: "Error al autenticarse")
            }
        }
    }
}
