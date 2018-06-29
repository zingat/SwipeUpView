//
//  SwipeUpViewDelegate.swift
//  Pods-SwipeUpView_Example
//
//  Created by cinaryusuf on 28.06.2018.
//

import UIKit

public protocol SwipeUpViewDelegate : class {
    
    func stateWillChange (_ swipeUpView : SwipeUpView, stateIndex : Int);
    func stateDidChange (_ swipeUpView : SwipeUpView, stateIndex : Int);
    
    func stateWillOpen (_ swipeUpView : SwipeUpView);
    func stateDidOpen (_ swipeUpView : SwipeUpView);
    
    func stateWillClose (_ swipeUpView : SwipeUpView);
    func stateDidClose (_ swipeUpView : SwipeUpView);
    
}

