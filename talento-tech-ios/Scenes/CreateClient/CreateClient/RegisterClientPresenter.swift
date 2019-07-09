//
//  RegisterClientPresenter.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/26/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol RegisterClientIPresenter {
    func onViewDidLoad()
    var router: RegisterClientRouter { get }
    func saveClientBD(name:String, lastName:String, age:String, birthDate:String)
}
class RegisterClientPresenter: RegisterClientIPresenter {
    
    var router: RegisterClientRouter
    private var interactor:RegisterClientInteractor
    private var view: RegisterClientView?
    
    init(view: RegisterClientView, interactor: RegisterClientInteractor, router:RegisterClientRouter) {
        self.interactor = interactor
        self.router = router
        self.view = view;
    }
    
    //MARK: RegisterClientIPresenter
    func onViewDidLoad() {
        self.view?.initView()
    }
    
    func saveClientBD(name:String, lastName:String, age:String, birthDate:String) {
        var client = Client()
        client.name = name
        client.lastName = lastName
        client.age = age
        client.birthDate = birthDate
        self.view?.showProgressActivityView(message: "")
        
        self.interactor.saveClient(client: client) { (save) in
            self.view?.hideProgressActivityView()
            if save {
                self.router.presentConfirmRegisterClient()
            } else {
                self.view?.showMessageError(message: "Error al guardar el cliente")
            }
        }
        
    }

}
