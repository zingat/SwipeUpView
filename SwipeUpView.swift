//
//  SwipeUpView.swift
//  Pods-SwipeUpView_Example
//
//  Created by cinaryusuf on 28.06.2018.
//

import UIKit

public class SwipeUpView: UIView  {
  
    private var isHeaderButtonDirectionToTop = true
    private var activeIndex = 0
    private var isOpen = false
    
    private weak var mainView : UIView?
    
    public weak var delegate: SwipeUpViewDelegate?
    public weak var datasource : SwipeUpViewDatasource?
    
    
    public init(frame: CGRect, mainView: UIView){
        super.init(frame: frame)
    
        self.isUserInteractionEnabled = true
        self.backgroundColor = .clear
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClickedHeaderButton)))
        
        self.mainView = mainView
        self.frame = CGRect(x: 0, y: mainView.frame.height , width: mainView.frame.width, height: 0);
    }
    
    
    public var swipeContentView : UIView? {
        didSet {
            addItemContainerView()
        }
    }
    
    
    public lazy var headerContainerButton : UIButton = {
        
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("", for: UIControlState.normal)
        button.clipsToBounds = true
        button.backgroundColor = UIColor.darkGray
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(onClickedHeaderButton), for: .touchUpInside)
        return button
        
    }()
    
    lazy var headerButtonPanGesture : UIPanGestureRecognizer = {
        return UIPanGestureRecognizer(target: self, action: #selector(handleButtonPanGesture(recognizer:)))
    }()
    
    @objc func handleButtonPanGesture(recognizer : UIPanGestureRecognizer){
        
        guard let mainView = self.mainView , let datasource = self.datasource else {  return }
        
        if recognizer.state == .ended {
            let index = findNewHeightPercentageIndex()
            
            let stateHeightPercentages = datasource.heightPercentages(self)
            
            adjustHeaderButtonDirection(stateHeightPercentagesCount: stateHeightPercentages.count, index: index)
            
            self.adjustMyHeight(heigthPercentageIndex: findNewHeightPercentageIndex());
        }
        
        //mainView.bringSubview(toFront: self)
        
        let translationRec = recognizer.translation(in: mainView)
        
        self.center = CGPoint(x: self.center.x , y: self.center.y + translationRec.y)
        
        
        var f = self.frame;
        f.size.height = mainView.frame.height - f.origin.y;
        
        if f.size.height <= mainView.frame.height || f.origin.y > 0{
            self.frame = f;
        }
        
        recognizer.setTranslation(.zero, in: mainView)
    }
    
    
    //TODO BAKACAZ
    lazy var swipeGestureRecognizerDown : UISwipeGestureRecognizer = {
        let  sg = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGestureDown(sender :)))
        sg.direction = .down
        
        return sg
    }()
    lazy var swipeGestureRecognizerUp : UISwipeGestureRecognizer = {
        let  sg = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGestureDown(sender :)))
        sg.direction = .down
        sg.numberOfTouchesRequired = 1
        return sg
    }()
    
    
    
    @objc func handleSwipeGestureDown(sender : UISwipeGestureRecognizer)  {
        adjustMyHeight(heigthPercentageIndex: setupNewIndexForIndex(index: 0))
        isHeaderButtonDirectionToTop = true
    }
    @objc func handleSwipeGestureUp(sender : UISwipeGestureRecognizer)  {
        guard  let datasource = self.datasource else { return }
        
        let stateHeightPercentages = datasource.heightPercentages(self)
        
        adjustMyHeight(heigthPercentageIndex: setupNewIndexForIndex(index: stateHeightPercentages.count - 1))
        isHeaderButtonDirectionToTop = false
    }
    
    
    private func findNewHeightPercentageIndex() -> Int{
        guard let mainView = self.mainView, let datasource = self.datasource else {
            return 0
        }
        
        let ratio = self.frame.height / mainView.frame.height;
        
        let stateHeightPercentages = datasource.heightPercentages(self)
        let activeRatio = stateHeightPercentages[activeIndex]
        
        if(ratio < activeRatio && activeIndex > 0){
            for index in (0 ... activeIndex-1).reversed() {
                if stateHeightPercentages[index] < ratio{
                    return index
                }
            }
            
            return 0
        }
        
        if(ratio > activeRatio && activeIndex < stateHeightPercentages.count - 1){
            for index in activeIndex+1 ..< stateHeightPercentages.count{
                if stateHeightPercentages[index] > ratio{
                    return index
                }
            }
            
            return stateHeightPercentages.count - 1
        }

        return activeIndex
    }
    
    @objc func onClickedHeaderButton(){
        guard  let datasource = self.datasource else { return }
        
        let stateHeightPercentages = datasource.heightPercentages(self)
        
        let index = findNewHeightPercentageIndex()
        adjustHeaderButtonDirection(stateHeightPercentagesCount: stateHeightPercentages.count, index: index)
        adjustMyHeight(heigthPercentageIndex: setupNewIndexForIndex(index: index))
    }
    
    private func adjustMyHeight(heigthPercentageIndex : Int){
        guard let mainView = self.mainView, let datasource = self.datasource  else { return  }
        
        self.delegate?.swipeUpViewStateWillChange(self, stateIndex: heigthPercentageIndex)
        
        activeIndex = heigthPercentageIndex
        let heigthPercentage : CGFloat = datasource.heightPercentages(self)[heigthPercentageIndex]
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            var frame = self.frame
            frame.origin.y = mainView.frame.size.height * (1.0 - heigthPercentage)
            frame.size.height = mainView.frame.size.height * heigthPercentage
            self.frame = frame
            
            self.layoutIfNeeded()
        }, completion: { (_) in
            self.delegate?.swipeUpViewStateDidChange(self, stateIndex: heigthPercentageIndex)
            if(self.isOpen == false){
                self.isOpen = true
                self.delegate?.swipeUpViewDidOpen(self)
            }
        });
        
    }
    private func setupNewIndexForIndex(index : Int) -> Int {
        return isHeaderButtonDirectionToTop ? index + 1 : index - 1
    }
    
    private func addItemContainerView() {
        guard let swipeContentView = self.swipeContentView , let mainView = self.mainView else { return  }
        
        let width = mainView.frame.size.width
        swipeContentView.layer.cornerRadius = 6
        
        self.addGestureRecognizer(swipeGestureRecognizerUp)
        self.addGestureRecognizer(swipeGestureRecognizerDown)
        
        self.addSubview(headerContainerButton)
        self.addSubview(swipeContentView)
        
        self.addGestureRecognizer(self.headerButtonPanGesture)
        
        frameItemContainerView(width: width)
    }
    
    
    private  func frameItemContainerView(width : CGFloat) {
        guard let datasource = self.datasource , let swipeContentView = self.swipeContentView  else { return  }
        
        var contentX : CGFloat = 0.0
        if datasource.hideHeaderButton(self) == false {
            contentX = datasource.heightOfHeaderButton(self) + datasource.marginOfHeaderButton(self)
            
            self.headerContainerButton.translatesAutoresizingMaskIntoConstraints = false
            self.addConstraints([
                NSLayoutConstraint(item: self.headerContainerButton, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: self.headerContainerButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: datasource.heightOfHeaderButton(self)),
                NSLayoutConstraint(item: self.headerContainerButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0)
                ])
        }
        
        swipeContentView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([
            NSLayoutConstraint(item: swipeContentView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: contentX),
            NSLayoutConstraint(item: swipeContentView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: swipeContentView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: swipeContentView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0),
            ])
    }
    
    public func openViewPage()  {
        
        guard let mainView = self.mainView, let datasource = self.datasource else {
            return
        }
        self.delegate?.swipeUpViewWillOpen(self)
        
        mainView.addSubview(self)
        self.frame = CGRect(x: 0, y: mainView.frame.height , width: mainView.frame.width, height: 0);
        
        adjustMyHeight(heigthPercentageIndex: datasource.firstOpenHeightPercentageIndex(self))
    }
    
    public  func closeViewPage()  {
        
        guard let mainView = self.mainView else { return  }
        
        self.delegate?.swipeUpViewWillOpen(self)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            
            self.frame = CGRect(x: 0, y: mainView.frame.height , width: mainView.frame.width, height: mainView.frame.height);
            
        }) { (_) in
            self.delegate?.swipeUpViewDidClose(self)
            self.isOpen = false
            self.removeFromSuperview()
        }
    }
    
    
    func adjustHeaderButtonDirection(stateHeightPercentagesCount : Int, index : Int){
        if index == stateHeightPercentagesCount - 1 {
            self.isHeaderButtonDirectionToTop = false
        }
        if  index == 0 {
            self.isHeaderButtonDirectionToTop = true
        }
    }
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

