//
//  BottomView.swift
//  SwipeUpView_Example
//
//  Created by Kadir Kemal Dursun on 29.06.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

public class BottomView: UIView  {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
