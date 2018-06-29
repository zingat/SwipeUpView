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
    
    lazy var  tabButton : UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("TabButton", for: UIControlState.normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(handleTabButtonTouchUpInside), for: .touchUpInside)
        return button
    }()
    
    
    lazy var swipeUpView : SwipeUpView = {
        let mg = SwipeUpView(frame: .zero, mainView: self.view)
        mg.delegate = self
        mg.datasource = self
        
        mg.swipeContentView = BottomView(frame:.zero)
        
        return mg
    }()
    
    
    @objc func handleTabButtonTouchUpInside()  {
        
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
        
        
        self.view.backgroundColor = .blue
        
        self.view.addSubview(tabButton)
        
        self.tabButton.frame = CGRect(x: 100, y: 200, width: 80, height: 30)
        
        
        
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
    
    func marginOfHeaderButton (_ swipeUpView : SwipeUpView) -> CGFloat {
        return 4.0
    }
    
    func firstOpenHeightPercentageIndex(_ swipeUpView: SwipeUpView) -> Int {
        return 1
    }
    
    func heightPercentages(_ swipeUpView: SwipeUpView) -> [CGFloat] {
        return [0.1 ,0.5, 1]
    }
    
    func stateWillChange(_ swipeUpView: SwipeUpView, stateIndex: Int) {
        
    }
    
    func stateDidChange(_ swipeUpView: SwipeUpView, stateIndex: Int) {
        
    }
    
    func stateWillOpen(_ swipeUpView: SwipeUpView) {
        
    }
    
    func stateDidOpen(_ swipeUpView: SwipeUpView) {
        
    }
    
    func stateWillClose(_ swipeUpView: SwipeUpView) {
        
    }
    
    func stateDidClose(_ swipeUpView: SwipeUpView) {
        
    }
    
    
    
}
