//
//  KSBaseViewController.swift
//  iOSInterview
//
//  Created by saeipi on 2020/4/24.
//  Copyright © 2020 saeipi. All rights reserved.
//

import UIKit

class KSBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = KS_Const_Color_Ctrl_Background
        title = NSStringFromClass(type(of: self))
    }
}
