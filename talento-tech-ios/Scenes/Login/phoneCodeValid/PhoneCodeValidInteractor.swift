//
//  PhoneCodeValidInteractor.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/27/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit
import Firebase

class PhoneCodeValidInteractor {
    
    func verifyPhoneNumber(phoneCode: String, verificationId: String, completion:@escaping (Bool) -> Void) {
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: phoneCode)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            completion(true)
        }
    }
}
