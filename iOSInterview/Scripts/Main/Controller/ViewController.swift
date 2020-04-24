//
//  ViewController.swift
//  iOSInterview
//
//  Created by saeipi on 2020/4/24.
//  Copyright © 2020 saeipi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let args             = NSMutableDictionary()
        args["className"]    = "KSSandboxController"
        args["isCallMethod"] = true
        args["method"]       = "keyedArchiver"

        KSReflection.routeNavigationCtrl(self.navigationController, args: args)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

