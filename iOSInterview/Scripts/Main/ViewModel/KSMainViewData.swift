//
//  KSMainViewData.swift
//  iOSInterview
//
//  Created by saeipi on 2020/4/28.
//  Copyright © 2020 saeipi. All rights reserved.
//

import UIKit

class KSMainViewData: NSObject {
    
    lazy var datas: [KSFunctionPage] = {
        let datas = pageDatas()
        return datas
    }();
    
    func pageDatas() ->[KSFunctionPage] {
        return [KSFunctionPage.init(KSKVOController.self),
                KSFunctionPage.init(KSKVOController.self),
                KSFunctionPage.init(KSKVOController.self),
                KSFunctionPage.init(KSKVOController.self),
                KSFunctionPage.init(KSKVOController.self),
                KSFunctionPage.init(KSKVOController.self),
                KSFunctionPage.init(KSKVOController.self),
                KSFunctionPage.init(KSKVOController.self),
                KSFunctionPage.init(KSKVOController.self),
        ]
    }
}
