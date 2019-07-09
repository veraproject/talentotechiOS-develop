//
//  ListClientInteractor.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 26/03/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import Firebase
import SwiftyJSON

class ListClientInteractor {

    private var referenceDB: DatabaseReference!
    
    init(reference: DatabaseReference) {
        self.referenceDB = reference
    }
    
    func listClients(completion:@escaping ([Client]) -> Void) {
        var clientList = [Client]()
        self.referenceDB.observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                
                clientList.removeAll()
                
                for clients in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let clientObject = JSON(clients.value ?? JSON.null)
                    let clientName = clientObject["name"].string
                    let clientLastName = clientObject["lastName"].string
                    let clientAge = clientObject["age"].string
                    let clientBirthDate = clientObject["birthDate"].string
                    
                    let client = Client(name: clientName, lastName: clientLastName, age: clientAge, birhtDate: clientBirthDate)
                    
                    clientList.append(client)
                    
                }
            }
            
            completion(clientList)
        }) { (error) in
            print(error.localizedDescription)
            completion([Client]())
        }
    }
    
}
