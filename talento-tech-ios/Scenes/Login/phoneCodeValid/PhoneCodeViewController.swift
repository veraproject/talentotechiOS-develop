//
//  PhoneCodeViewController.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/27/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol PhoneCodeValidView: BaseView {
    func showVerificationCodeError(error:String)
}

class PhoneCodeViewController: BaseViewController, PhoneCodeValidView {

    public var presenter:PhoneCodeValidIPresenter?
    @IBOutlet weak var txtPhoneCode: UITextField!
    
    //MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        PhoneCodeValidConfigurator.sharedInstance.configure(viewController: self)
        self.presenter?.onViewDidLoad()
    }

    //MARK: PhoneCodeValidView
    func initView() {
        self.txtPhoneCode.isSecureTextEntry = false;
        self.txtPhoneCode.textAlignment = .center
        self.txtPhoneCode.keyboardType = .numberPad
        self.txtPhoneCode.addDoneOnKeyboardWithTarget(self, action: #selector(self.doneActionNextView(_:)))
        
    }
    
    func showVerificationCodeError(error: String) {
        let alertController = UIAlertController(title: "Login Error", message: error, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okayAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: Methods Own
    @objc func doneActionNextView(_ sender : UITextField!) {
        self.view.endEditing(true)
        
        guard let text = self.txtPhoneCode.text , text.count > 0 else {
            self.showVerificationCodeError(error: "Ingresa un código válido.")
            return
        }
        
        self.presenter?.validCode(code: text)
    }
}
