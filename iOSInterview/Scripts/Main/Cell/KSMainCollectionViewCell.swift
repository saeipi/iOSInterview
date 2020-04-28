//
//  KSMainCollectionViewCell.swift
//  iOSInterview
//
//  Created by saeipi on 2020/4/28.
//  Copyright © 2020 saeipi. All rights reserved.
//

import UIKit

class KSMainCollectionViewCell: UICollectionViewCell {
    
    var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createChildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createChildViews() {
        self.backgroundColor = KS_Const_Color_Cell_Background
        textLabel            = UILabel.init(textFont: UIFont.systemFont(ofSize: 14), alignment: NSTextAlignment.center)
        self.addSubview(textLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.frame = self.bounds
    }
    
    func updateTitle(_title:String?) {
        textLabel.text = _title
    }
}
