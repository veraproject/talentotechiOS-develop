//
//  Constants.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 3/28/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

class Constants {
    
    static let IS_IPHONE = (UI_USER_INTERFACE_IDIOM() == .phone)
    static let IS_IPHONE4S = (UIScreen.main.bounds.size.height == 480.0)
    static let IS_IPHONE5 = (IS_IPHONE && UIScreen.main.bounds.size.height == 568.0)
    static let IS_IPHONE6 = (IS_IPHONE && UIScreen.main.bounds.size.height == 667.0)
    static let IS_IPHONE6_PLUS = (IS_IPHONE && UIScreen.main.bounds.size.height == 736.0)
    static let IS_IPHONEX = (IS_IPHONE && UIScreen.main.bounds.size.height == 812.0)
}
