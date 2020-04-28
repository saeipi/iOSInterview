//
//  ViewController.swift
//  iOSInterview
//
//  Created by saeipi on 2020/4/24.
//  Copyright © 2020 saeipi. All rights reserved.
//

import UIKit

class ViewController: KSBaseViewController {

    let mainCellIdentifier = "mainCellIdentifier"
    lazy var viewData: KSMainViewData = KSMainViewData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor          = UIColor.white
        let flowLayout                     = UICollectionViewFlowLayout()
        flowLayout.itemSize                = CGSize.init(width: self.ks_screenWidth()/2 - 10, height: 50)
        flowLayout.minimumLineSpacing      = 2//同一组当中，行与行之间的最小行间距，但是不同组之间的不同行cell不受这个值影响。
        flowLayout.minimumInteritemSpacing = 2//同一行的cell中互相之间的最小间隔，设置这个值之后，那么cell与cell之间至少为这个值
        let collectionView                 = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.backgroundColor     = UIColor.white
        self.view.addSubview(collectionView)
        collectionView.dataSource          = self
        collectionView.delegate            = self
        collectionView.register(KSMainCollectionViewCell.self, forCellWithReuseIdentifier: mainCellIdentifier)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewData.datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainCellIdentifier, for: indexPath) as! KSMainCollectionViewCell
        cell.updateTitle(_title: viewData.datas[indexPath.item].desc)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let page = self.viewData.datas[indexPath.row];
        _ = self.routerPush(self.navigationController, classType: page.type)
    }
}
