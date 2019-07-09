//
//  HomeViewController.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 7/09/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol HomeView: BaseView {
    func goToRegisterUser()
}

class HomeViewController: BaseViewController, HomeView {
    public var presenter:HomeIPresenter?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeConfigurator.sharedInstance.configure(viewController: self)
        self.presenter?.viewDidLoad()
    }
    
    //MARK: HomeView
    func initView() {
        
    }
    
    func goToRegisterUser() {
        
    }
    
    //MARK: Actions
    @IBAction func createUserTapped(_ sender: Any) {
        self.presenter?.goToCreateUser()
    }
    
    @IBAction func listClientsTapped(_ sender: Any) {
        self.presenter?.listClients()
    }
    
    @IBAction func closeSessionTapped(_ sender: Any) {
        self.presenter?.closeSession()
    }
}
