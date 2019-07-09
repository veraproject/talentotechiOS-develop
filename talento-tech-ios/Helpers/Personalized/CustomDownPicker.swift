//
//  CustomDownPicker.swift
//  billetera-ios
//
//  Created by Home on 25/04/18.
//  Copyright © 2018 MSonicNet. All rights reserved.
//

import UIKit

protocol CustomDownPickerDelegate {
    func downPickerItemSelected(textFieldSelected:UITextField, itemSelected:Any)
}

class CustomDownPicker: UIControl {
    private var pickerView:UIPickerView!
    private var textField:UITextField!
    private var dataArray:[AnyObject]?
    private var placeholder:String?
    private var placeholderWhileSelecting:String?
    private var toolbarDoneButtonText:String?
    private var toolbarStyle:UIBarStyle?
    private var selectedIndex:Int = -1
    private var displayField:String?
    
    public var text:String = ""
    var delegate: CustomDownPickerDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textField:UITextField, data:[Any], displayField:String, placeholder:String) {
        
        super.init(frame: .zero)
        
        self.textField = textField
        self.displayField = displayField
        self.placeholder = placeholder
        
        self.textField.textAlignment = .left
        self.textField.delegate = self
        
        self.selectedIndex = 0
        self.toolbarStyle = .default
        self.toolbarDoneButtonText = "Aceptar"
        
        
        let color: UIColor? = self.textField.textColor
        self.textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: color ?? .clear])

        
        self.dataArray = parserListObjetcToDictionary(data) as [AnyObject]
        
    }
    
    //Methods Own
    private func parserListObjetcToDictionary(_ list:[Any]) -> [Any] {
        
        var listDictionary:[Any] = []
        var dictionary:[String:Any] = Dictionary.init()
        
        for item in list {
            if let object = item as? String {
                dictionary["id"] = object
                dictionary["description"] = object
            }
            
            listDictionary.append(dictionary)
        }
        return listDictionary
    }
    
    @objc func doneClicked(sender:Any) {
        self.textField.resignFirstResponder()
        
        if textField.text?.count == 0 {
            var itemList = dataArray![0]
            
            if self.displayField != nil {
                itemList  = itemList.value(forKey: self.displayField!) as AnyObject
            }
            textField.text = itemList as? String
            pickerView.reloadAllComponents()
        }
        
        if delegate != nil {
            self.delegate?.downPickerItemSelected(textFieldSelected:textField, itemSelected: dataArray![selectedIndex])
        }
        
        self.sendActions(for: .valueChanged)
    }
    
    func showDownPicker() {
        pickerView = UIPickerView()
        pickerView.backgroundColor = UIColor.white
        pickerView.showsSelectionIndicator = true
        pickerView.dataSource = self
        pickerView.delegate = self
        
        if self.textField.text?.count == 0 {
            textField.placeholder = placeholderWhileSelecting
        }
        pickerView.selectRow(selectedIndex, inComponent: 0, animated: true)
        
        let toolbar = UIToolbar()
        toolbar.barStyle = self.toolbarStyle!
        toolbar.backgroundColor = Color.transparentGray
        toolbar.sizeToFit()
        
        let flexibleSpaceLeft = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: toolbarDoneButtonText, style: .done, target: self, action: #selector(self.doneClicked(sender:)))
        
        doneButton.tintColor = Color.pastelGray
        toolbar.setItems([flexibleSpaceLeft, doneButton], animated: false)
    
        //custom input view
        self.textField.inputView = pickerView
        self.textField.inputAccessoryView = toolbar
        
    }
    
    func setToolbarDoneButtonText(_ titleButtonDone: String) {
        toolbarDoneButtonText = titleButtonDone
    }
    
    func setToolbarStyle(_ style: UIBarStyle) {
        toolbarStyle = style
    }
    
    func getPickerView() -> UIPickerView {
        return pickerView
    }
    
    func getTextField() -> UITextField {
        return textField
    }
    
    func setValueAt(_ index: Int) {
        selectedIndex = -1
        
        if self.pickerView == nil {
            self.pickerView = UIPickerView()
        }
        pickerView(self.pickerView, didSelectRow: index, inComponent: 0)
        
    }
    
    func setValueItemObject(_ object: AnyObject) {
        var selectIndexItem = 0
        selectIndexItem = dataArray!.index(where: { (item) -> Bool in
            item === object
        })!
        setValueAt(selectIndexItem)
    }
    
    func isEqual<T: Equatable>(type: T.Type, a: Any, b: Any) -> Bool? {
        guard let a = a as? T, let b = b as? T else { return nil }
        
        return a == b
    }
}
extension CustomDownPicker:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        guard let _ = dataArray, dataArray!.count > 0 else {
            return false
        }
        
        self.showDownPicker()
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}

extension CustomDownPicker: UIPickerViewDelegate, UIPickerViewDataSource  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (self.dataArray?.count)!
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var tView = view as? UILabel
        
        if tView == nil {
            tView = UILabel()
            tView?.textColor = UIColor.gray
            
            if row == selectedIndex {
                tView?.textColor = UIColor.black
            }
            
            StylesApp.personalizeLabel(tView!, withSizeFont: 13, withBold: false)
        }
        
        var itemList = dataArray![row]
        if self.displayField != nil {
            itemList  = itemList.value(forKey: self.displayField!) as AnyObject
        }
        
        tView?.text = itemList as? String
        
        tView?.textAlignment = .center
        
        return tView!
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(selectedIndex == row){ return }
        
        selectedIndex = row
        
        var itemList = dataArray![row]
        
        if self.displayField != nil {
            itemList  = itemList.value(forKey: self.displayField!) as AnyObject
        }
        
        self.textField.text = itemList as? String
        
        if (delegate != nil) {
            delegate?.downPickerItemSelected(textFieldSelected:textField, itemSelected: dataArray![row])
            
        }
        
        pickerView.reloadAllComponents()
    }
}
