//
//  RegisterClientViewController.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/26/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit
import Firebase

protocol RegisterClientView: BaseView {
    func showMessageError(message: String)
    func clearMessageError()
    func loadYears()
}

class RegisterClientViewController: BaseViewController, RegisterClientView {
    
    static let characterCountLimit = 50
    static let characterCountLimitAge = 3
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var dateYearTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    public var presenter:RegisterClientIPresenter?
    
    
    let datePicker:UIDatePicker = UIDatePicker()
    
    //MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterClientConfigurator.sharedInstance.configure(viewController: self)
        self.presenter?.onViewDidLoad()
    }

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter?.router.prepare(for: segue, sender: sender)
    }
    
    //MARK:Actions
    @IBAction func regiterClientTapped(_ sender: Any) {
        guard let name = self.nameTextField.text, name.count > 0 , let lastName = self.lastNameTextField.text, lastName.count > 0, let age = self.ageTextField.text, age.count > 0, let birthDate = self.dateYearTextField.text , birthDate.count > 0 else {
            showMessageError(message: "Campos obligatorios.")
            return
        }
        
        self.presenter?.saveClientBD(name: name, lastName: lastName, age: age, birthDate: birthDate)
    }
    
    @objc func donedatePicker(_ sender : UITextField!){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateYearTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    //MARK:RegisterClientView
    func initView() {
        self.dateYearTextField.textAlignment = .left
        self.dateYearTextField.addDoneOnKeyboardWithTarget(self, action: #selector(self.donedatePicker(_:)))
    }
    
    func showMessageError(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okayAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func clearMessageError() {
        self.nameTextField.text = ""
        self.lastNameTextField.text = ""
        self.ageTextField.text = ""
        self.dateYearTextField.text = ""
    }
    
    func loadYears() {
        datePicker.datePickerMode = .date
        dateYearTextField.inputView = datePicker
    }
}

//MARK: UITextFieldDelegate
extension RegisterClientViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.dateYearTextField {
            self.loadYears()
        }
        
    }
    
    func textField(_ textFieldToChange: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let startingLength = textFieldToChange.text?.count ?? 0
        let lengthToAdd = string.count
        let lengthToReplace = range.length
        
        let newLength = startingLength + lengthToAdd - lengthToReplace
        
        if(textFieldToChange == self.nameTextField || textFieldToChange == self.lastNameTextField) {
            return newLength <= RegisterClientViewController.characterCountLimit
        } else if textFieldToChange == self.ageTextField {
            return newLength <= RegisterClientViewController.characterCountLimitAge
        }
        
        return true
    }
}
