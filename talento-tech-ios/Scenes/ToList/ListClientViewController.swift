//
//  ListClientViewController.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 26/03/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol ListClientView: BaseView {
    func hideMovementsTable()
    func reloadMovements()
    func resizeTableView(height: CGFloat)
}

class ListClientViewController: BaseViewController, ListClientView {
    
    let IDENTIFIER_CELL = "identifierClientsCell"
    
    @IBOutlet weak var clientsTableView: UITableView!
    
    @IBOutlet weak var messageLabel: UILabel!
    public var presenter: ListClientIPresenter?
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    //MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        ListClientConfigurator.sharedInstance.configure(viewController: self)
        self.presenter?.viewDidLoad()
    }
    
    
    //MARK: ListClientView
    func initView() {
        //Registrando la celda
        clientsTableView.register(UINib(nibName: "ClientViewCell", bundle: nil), forCellReuseIdentifier: IDENTIFIER_CELL)
        
        self.clientsTableView.layer.cornerRadius = 5
        self.clientsTableView.layer.masksToBounds = true
        self.clientsTableView.layer.borderWidth = 0.5
        self.clientsTableView.layer.borderColor = Color.transparentGray.cgColor
        
        self.presenter?.getClientsService()
    }
    
    func hideMovementsTable() {
        self.clientsTableView.isHidden = true
        messageLabel.isHidden = false
    }
    
    func reloadMovements() {
        self.clientsTableView.reloadData()
        self.presenter?.resizeTableView()
    }
    
    func resizeTableView(height: CGFloat) {
        self.heightConstraint.constant = height
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension ListClientViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.presenter?.getNumberClients())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ClientViewCell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_CELL,
                                                                   for: indexPath) as! ClientViewCell
        return (self.presenter?.loadClient(cell:cell, index: indexPath.row))!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
