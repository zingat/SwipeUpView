//
//  ViewController.swift
//  SwipeUpView
//
//  Created by kadirkemal on 06/29/2018.
//  Copyright (c) 2018 kadirkemal. All rights reserved.
//

import UIKit
import SwipeUpView

class ViewController: UIViewController {
    var isOpenCloseControl = true
    
    lazy var bottomView : BottomView = {
        return BottomView(frame:.zero)
    }()
    
    lazy var swipeUpView : SwipeUpView = {
        let mg = SwipeUpView(frame: .zero, mainView: self.view)
        mg.delegate = self
        mg.datasource = self
        
        mg.swipeContentView = bottomView
        
        return mg
    }()
    
    @IBAction func onClickedButton(_ sender: Any) {
        if isOpenCloseControl  {
            isOpenCloseControl = false
            swipeUpView.openViewPage()
            
        }
        else {
            isOpenCloseControl = true
            swipeUpView.closeViewPage()
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController : SwipeUpViewDatasource ,SwipeUpViewDelegate {
    
    func hideHeaderButton(_ swipeUpView: SwipeUpView) -> Bool {
        return false
    }
    
    func heightOfHeaderButton (_ swipeUpView : SwipeUpView) -> CGFloat {
        return 8.0
    }
    
    func widthOfHeaderButton (_ swipeUpView : SwipeUpView) -> CGFloat {
        return 50.0
    }
    
    func marginOfHeaderButton (_ swipeUpView : SwipeUpView) -> CGFloat {
        return 4.0
    }
    
    func colorOfHeaderButton (_ swipeUpView : SwipeUpView) -> UIColor {
        return .white
    }
    
    func firstOpenHeightPercentageIndex(_ swipeUpView: SwipeUpView) -> Int {
        return 1
    }
    
    func heightPercentages(_ swipeUpView: SwipeUpView) -> [CGFloat] {
        return [0.1, 0.5, 0.95]
    }
    
    func swipeUpViewStateWillChange (_ swipeUpView : SwipeUpView, stateIndex : Int){
        NSLog("SwipeUpView state will change to %i", stateIndex)
        
        if stateIndex == 2 {
            bottomView.useVerticalImage()
        }else{
            bottomView.useHorizontalImage()
        }
    }
    
    func swipeUpViewStateDidChange (_ swipeUpView : SwipeUpView, stateIndex : Int){
        NSLog("SwipeUpView state did change to %i", stateIndex)
    }
    
    func swipeUpViewWillOpen (_ swipeUpView : SwipeUpView){
        NSLog("SwipeUpView state will open")
    }
    
    func swipeUpViewDidOpen (_ swipeUpView : SwipeUpView){
        NSLog("SwipeUpView state did open")
    }
    
    func swipeUpViewWillClose (_ swipeUpView : SwipeUpView){
        NSLog("SwipeUpView state will close")
    }
    
    func swipeUpViewDidClose (_ swipeUpView : SwipeUpView){
        NSLog("SwipeUpView state did close")
    }
    
    
    
}
