//
//  LoginViewController.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 7/09/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol LoginView: BaseView {
    func showLoginError(error:String)
    func showContainerLoginPhone()
    func enableFacebookButton(enable: Bool)
}

class LoginViewController: BaseViewController, LoginView {

    @IBOutlet weak var phoneNumberButton: CustomButton!
    @IBOutlet weak var facebookButton: CustomButton!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var containerNumberLoginView: UIView!
    @IBOutlet weak var fbButtonTopLabelBottomContraint: NSLayoutConstraint!
    
    let characterCountLimit = 9;
    
    public var presenter:LoginIPresenter?
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginConfigurator.sharedInstance.configure(viewController: self)
        self.presenter?.onViewDidLoad()
    }

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter?.router.prepare(for: segue, sender: sender)
    }
    
    //MARK: Actions
    @IBAction func loginTapped(_ sender: Any) {
        self.presenter?.loginFacebook()
    }
    
    @IBAction func loginPhoneNumberTypeTapped(_ sender: Any) {
        guard let numberCell = self.phoneNumberTextField.text, numberCell.count == 9 else {
            showLoginError(error: "Campo obligatorio o no completo correctamente los 9 dígitos")
            return
        }
        let _numberCell = "+51"+numberCell
        self.presenter?.verifyPhoneNumber(phone: _numberCell)
    }
    
    @IBAction func loginPhoneNumberTapped(_ sender: Any) {
       self.presenter?.showPhoneLoginView()
    }
    
    
    //MARK:LoginView
    func initView() {
        self.containerNumberLoginView.isHidden = true
        self.phoneNumberButton.isHidden = false
        self.view.bringSubview(toFront: self.phoneNumberButton)
        
        if Constants.IS_IPHONE5 {
            fbButtonTopLabelBottomContraint.constant += 20
        } else if Constants.IS_IPHONE6 {
            fbButtonTopLabelBottomContraint.constant += 60
        } else if Constants.IS_IPHONE6_PLUS {
            fbButtonTopLabelBottomContraint.constant += 80
        } else if Constants.IS_IPHONEX {
            fbButtonTopLabelBottomContraint.constant += 100
            
        }
    }
    
    func showLoginError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okayAction)
        self.present(alertController, animated: true, completion: nil)
    }

    func showContainerLoginPhone() {
        self.containerNumberLoginView.isHidden = false
        self.phoneNumberButton.isHidden = true
    }
    
    func enableFacebookButton(enable: Bool) {
        self.facebookButton.backgroundColor = !(enable) ? Color.pastelGray : Color.pastelGreen
        self.facebookButton.isEnabled = enable
        
        if !self.containerNumberLoginView.isHidden {
            self.containerNumberLoginView.isHidden = true
            self.phoneNumberTextField.text = ""
            self.phoneNumberButton.isHidden = false
        }
    }

}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textFieldToChange: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let startingLength = textFieldToChange.text?.count ?? 0
        let lengthToAdd = string.count
        let lengthToReplace = range.length
        
        let newLength = startingLength + lengthToAdd - lengthToReplace
        
        return newLength <= characterCountLimit
    }
    
}
