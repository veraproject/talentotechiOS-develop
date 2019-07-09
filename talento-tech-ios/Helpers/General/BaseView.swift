//
//  BaseView.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 7/09/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol BaseView {
    
    func initView()
    
    func showProgressActivityView(message :String)
    
    func hideProgressActivityView()
}

extension BaseView {
    
    func initView() {}
    
    func showProgressActivityView(message :String){}
    
    func hideProgressActivityView(){}
}
