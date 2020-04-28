//
//  UIViewController+KSExtensions.swift
//  WonWallet
//
//  Created by saeipi on 2019/9/5.
//  Copyright © 2019 worldopennetwork. All rights reserved.
//

import UIKit

extension UIViewController {
    func ks_navigationHeight() -> CGFloat {
        if let _height = self.navigationController?.navigationBar.frame.size.height {
            return UIApplication.shared.statusBarFrame.height + _height
        }
        return 64
    }
    
    func ks_tabBarHeight() -> CGFloat {
        if let _height = self.tabBarController?.tabBar.frame.size.height {
            return _height
        }
        return 49
    }
    
    static func className() -> String {
        let name = "\(self)"
        return name
        //return name.components(separatedBy: ".")[1];
    }
    
    static func routerNavigationCtrl(_ navCtrl: UINavigationController?, args: [AnyHashable : Any]) {
        let classType = NSClassFromString(args["className"] as? String ?? "") as? UIViewController.Type
        guard let _classType = classType, let _navCtrl = navCtrl else {
            return
        }
        let ctrl = UIViewController.routerNavCtrl(_navCtrl, classType: _classType)!
        if (args["isCallMethod"] as? Bool) ?? false {
            // 获取参数列表
            let parameters = args["parameters"] as? [AnyHashable : Any]
            if let method = args["method"] as? String {
                // 从字典中获取方法名，并调用对应的方法
                let selector = NSSelectorFromString(method)
                ctrl.perform(selector, with: parameters, afterDelay: 0)
            }
        }
    }
    
    static func routerNavCtrl(_ navCtrl: UINavigationController?, classType: UIViewController.Type) ->UIViewController? {
        guard let _navCtrl = navCtrl else {
            return nil
        }
        let ctrl: UIViewController = classType.init()
        _navCtrl.pushViewController(ctrl, animated: true)
        return ctrl
    }
    
    func routerPush(_ navCtrl: UINavigationController?, classType: UIViewController.Type) ->UIViewController? {
        return UIViewController.routerNavCtrl(navCtrl, classType: classType)
    }
}
