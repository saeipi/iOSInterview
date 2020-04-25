//
//  ViewController.swift
//  iOSInterview
//
//  Created by saeipi on 2020/4/24.
//  Copyright © 2020 saeipi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let mainCellIdentifier = "mainCellIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor          = UIColor.white
        let flowLayout                     = UICollectionViewFlowLayout()
        flowLayout.itemSize                = CGSize.init(width: self.ks_screenWidth()/4, height: 50)
        flowLayout.minimumLineSpacing      = 0//同一组当中，行与行之间的最小行间距，但是不同组之间的不同行cell不受这个值影响。
        flowLayout.minimumInteritemSpacing = 0//同一行的cell中互相之间的最小间隔，设置这个值之后，那么cell与cell之间至少为这个值
        flowLayout.scrollDirection         = .vertical
        let collectionView                 = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.backgroundColor     = UIColor.white
        self.view.addSubview(collectionView)
        collectionView.dataSource          = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: mainCellIdentifier)
        
        /*
        let args                           = NSMutableDictionary()
        args["className"]                  = "KSSandboxController"
        args["isCallMethod"]               = true
        args["method"]                     = "keyedArchiver"
        KSReflection.routeNavigationCtrl(self.navigationController, args: args)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainCellIdentifier, for: indexPath)
        return cell
    }
}
