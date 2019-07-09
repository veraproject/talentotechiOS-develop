//
//  ConfirmRegisterPresenter.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/26/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol ConfirmRegisterIPresenter {
    var router: ConfirmRegisterRouter { get }
    func onViewDidLoad()
    func presentToHome()
}

class ConfirmRegisterPresenter: ConfirmRegisterIPresenter {
    var router: ConfirmRegisterRouter
    private var view:ConfirmRegisterView
    
    
    init(view: ConfirmRegisterView, router: ConfirmRegisterRouter) {
        self.view = view
        self.router = router
    }
    
    //MARK: ConfirmRegisterIPresenter
    func onViewDidLoad() {
        self.view.initView()
    }
    
    func presentToHome() {
        self.router.routerToHome()
    }

}
