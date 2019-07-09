//
//  ListClientPresenter.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 26/03/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol ListClientIPresenter {
    func viewDidLoad()
    func getClientsService()
    func getNumberClients() -> Int
    func loadClient(cell:ClientViewCell, index: Int) -> ClientViewCell
    func resizeTableView()
}

class ListClientPresenter: ListClientIPresenter {
    
    private var interactor: ListClientInteractor
    private var view: ListClientView?
    
    private var clients:[Client]?
    
    init(interactor: ListClientInteractor, view: ListClientView) {
        self.interactor = interactor
        self.view = view
    }

    //MARK:ListClientIPresenter
    func viewDidLoad() {
        self.view?.initView()
    }
    
    func getClientsService() {
        self.view?.showProgressActivityView(message: "")
        
        self.interactor.listClients { (list) in
            self.view?.hideProgressActivityView()
            
            self.clients = list
            
            if list.count == 0 {
                self.view?.hideMovementsTable()
                return
            }
            self.view?.reloadMovements()
        }
    }
    
    func getNumberClients() -> Int {
        guard let count = self.clients?.count else {
            return 0
        }
        return count
    }
    
    func loadClient(cell: ClientViewCell, index: Int) -> ClientViewCell {
        if index % 2 == 0 {
            cell.backgroundColor = UIColor.groupTableViewBackground
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        guard let clientsList = self.clients else {
            return cell
        }
        
        let name = clientsList[index].name! + " " + clientsList[index].lastName!
        let age = clientsList[index].age
        let birthDate = clientsList[index].birthDate
        
        cell.namesLabel?.text = name
        cell.ageLabel?.text = age
        cell.birthDateLabel?.text = birthDate
        
        return cell
    }
    
    func resizeTableView() {
        let height:CGFloat = CGFloat(self.getNumberClients() * 30)
        self.view?.resizeTableView(height: height)
    }
}
