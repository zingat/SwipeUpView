//
//  SwipeUpViewDatasource.swift
//  Pods-SwipeUpView_Example
//
//  Created by cinaryusuf on 28.06.2018.
//

import UIKit


public protocol SwipeUpViewDatasource : class {
    
    func firstOpenHeightPercentageIndex (_ swipeUpView : SwipeUpView) -> Int
    func heightPercentages (_ swipeUpView : SwipeUpView) -> [CGFloat]
    
    func hideHeaderButton (_ swipeUpView : SwipeUpView) -> Bool
    func heightOfHeaderButton (_ swipeUpView : SwipeUpView) -> CGFloat
    func widthOfHeaderButton (_ swipeUpView : SwipeUpView) -> CGFloat
    func colorOfHeaderButton (_ swipeUpView : SwipeUpView) -> UIColor
    func marginOfHeaderButton (_ swipeUpView : SwipeUpView) -> CGFloat
    
}

