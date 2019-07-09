//
//  BaseRouter.swift
//  talento-tech-ios
//
//  Created by Pedro Vera on 7/09/19.
//  Copyright © 2019 Pedro Vera. All rights reserved.
//

import UIKit

protocol BaseRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

extension BaseRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
