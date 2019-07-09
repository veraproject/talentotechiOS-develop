//
//  LoginInteractor.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 7/09/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import FBSDKLoginKit
import Firebase

class LoginInteractor {
    private var viewController : BaseViewController
    
    init(viewController: BaseViewController){
        self.viewController = viewController
    }
    
    func loginFacebook(completion:@escaping (Bool) -> Void) {
        let fbLoginRequest = FBSDKLoginManager()
        fbLoginRequest.logIn(withReadPermissions: ["public_profile", "email"], from: self.viewController) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                completion(false)
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                completion(false)
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            // Perform login by calling Firebase APIs
            Auth.auth().signInAndRetrieveData(with: credential, completion: { (user, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    completion(false)
                } else {
                    completion(true)
                }
            })
        }
    }
    
    func verifyPhoneNumber(phoneNumber: String, completion:@escaping (Bool) -> Void) {
        Auth.auth().languageCode = "es";
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                print("Error verificando el numero: \(error.localizedDescription)")
                completion(false)
            } else {
                //guardar el verificationID
                let userDefaults = UserDefaults.standard
                userDefaults.setValue(verificationID, forKey: "authVerificationID")
                userDefaults.synchronize()
                completion(true)
            }
            
        }
    }
    
}
