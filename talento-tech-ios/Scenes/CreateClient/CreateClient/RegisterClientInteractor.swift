//
//  RegisterClientInteractor.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/26/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import Firebase

class RegisterClientInteractor {
    
    private var referenceDB: DatabaseReference!
    
    init(reference: DatabaseReference) {
        self.referenceDB = reference
    }
    
    func saveClient(client: Client, completion:@escaping (Bool) -> Void) {
        
        if let key = self.referenceDB.childByAutoId().key {
            
           let clientJson =  ["id":key,
             "name": client.name,
             "lastName": client.lastName,
             "age" : client.age,
             "birthDate" : client.birthDate
             
            ]
            
            self.referenceDB.child(key).setValue(clientJson) { (error:Error?, ref:DatabaseReference) in
                if let error = error {
                    print("Data could not be saved: \(error).")
                    completion(false)
                } else {
                    print("Data saved successfully!")
                    completion(true)
                }

            }
        } else {
            completion(false)
        }
        
    }
}
