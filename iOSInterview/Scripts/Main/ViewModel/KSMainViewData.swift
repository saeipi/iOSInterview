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
                KSFunctionPage.init(KSLoadController.self),
                KSFunctionPage.init(KSResponderChainController.self),
                KSFunctionPage.init(KSCopyController.self),
                KSFunctionPage.init(KSAssignController.self),
                KSFunctionPage.init(KSDispatchGroupController.self),
                KSFunctionPage.init(KSSemaphoreController.self),
                KSFunctionPage.init(KSBarrierController.self),
        ]
    }
}
