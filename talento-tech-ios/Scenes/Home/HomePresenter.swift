//
//  HomePresenter.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/26/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit
import Firebase

protocol HomeIPresenter {
    func viewDidLoad()
    var router: HomeRouter { get }
    func goToCreateUser()
    func closeSession()
    func listClients()
}

class HomePresenter: HomeIPresenter {
    
    public var router:HomeRouter
    
    private var view: HomeView?
    
    init(view: HomeView, router:HomeRouter) {
        self.router = router
        self.view = view;
    }
    
    //MARK: HomeIPresenter
    func viewDidLoad() {
        self.view?.initView()
    }
    
    func goToCreateUser() {
        self.router.routerToCreateUser()
    }
    
    func closeSession() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.router.routerToCloseSession()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    func listClients() {
        self.router.routerToListCliensView()
    }
}
