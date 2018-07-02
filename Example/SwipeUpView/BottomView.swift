//
//  BottomView.swift
//  SwipeUpView_Example
//
//  Created by Kadir Kemal Dursun on 29.06.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

public class BottomView: UIView  {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("BottomView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    public func useVerticalImage() {
        self.imageView.image = UIImage(named: "Zingat_dikey_logo")
    }
    
    public func useHorizontalImage() {
        self.imageView.image = UIImage(named: "zingat_yatay_logo")
    }
    
}
