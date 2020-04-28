//
//  KSFunctionPage.swift
//  iOSInterview
//
//  Created by saeipi on 2020/4/28.
//  Copyright © 2020 saeipi. All rights reserved.
//

import UIKit

class KSFunctionPage: NSObject {
    var type = UIViewController.self
    var desc: String = ""
    
    convenience init(_ type: UIViewController.Type) {
        self.init()
        self.type = type
        self.desc = type.description()
    }
}
