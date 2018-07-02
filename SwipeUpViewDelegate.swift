//
//  SwipeUpViewDelegate.swift
//  Pods-SwipeUpView_Example
//
//  Created by cinaryusuf on 28.06.2018.
//

import UIKit

public protocol SwipeUpViewDelegate : class {
    
    func swipeUpViewStateWillChange (_ swipeUpView : SwipeUpView, stateIndex : Int);
    func swipeUpViewStateDidChange (_ swipeUpView : SwipeUpView, stateIndex : Int);
    
    func swipeUpViewWillOpen (_ swipeUpView : SwipeUpView);
    func swipeUpViewDidOpen (_ swipeUpView : SwipeUpView);
    
    func swipeUpViewWillClose (_ swipeUpView : SwipeUpView);
    func swipeUpViewDidClose (_ swipeUpView : SwipeUpView);
    
}

